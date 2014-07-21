class TwitterTweeterIntegration
  require 'open-uri'
  def initialize(bike)
    @bike = bike
    @close_twitters = TwitterAccount.near(@bike, 50)
  end

  def create_tweet
    update_str = @bike.tweet_text
    update_opts = {}
    default_twitter = TwitterAccount.find_by(default: true)
    client = twitter_client_start(default_twitter)

    new_tweet = nil
    if (@bike.photo)
      Tempfile.open(['foto', '.jpg'], nil, 'wb+') do |foto|
        foto.binmode
        foto.write open(@bike.photo).read
        foto.rewind
        new_tweet = client.update_with_media(update_str, foto, update_opts)
      end
    else
      new_tweet = client.update(update_str, update_opts)
    end

    @tweet = Tweet.create(twitter_tweet_id: new_tweet.id, twitter_account: default_twitter, bike: @bike)

    retweet if @close_twitters.present?
    return @tweet
  end

  private


  def retweet
    retweets = []
    @close_twitters.each do |twitter_name|
      client = twitter_client_start(twitter_name)
      # retweet returns an array even with scalar parameters
      rt = client.retweet(@tweet[:twitter_tweet_id]).first
      retweets.push(Retweet.create(twitter_tweet_id: rt.id, twitter_account_id: twitter_name.id, bike_id: @tweet.bike.id, tweet_id: @tweet.id))
    end
  end



  def twitter_client_start(twitter_account)
    Twitter::REST::Client.new do |config|
      config.consumer_key        = twitter_account[:consumer_key]
      config.consumer_secret     = twitter_account[:consumer_secret]
      config.access_token        = twitter_account[:user_token]
      config.access_token_secret = twitter_account[:user_secret]
    end
  end
end
