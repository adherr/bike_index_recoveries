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

    if (@bike.photo)
      Tempfile.open(['foto', '.jpg'], nil, 'wb+') do |foto|
        foto.binmode
        foto.write open(@bike.photo).read
        foto.rewind
        @tweet = client.update_with_media(update_str, foto, update_opts)
      end
    else
      @tweet = client.update(update_str, update_opts)
    end

    retweet if @close_twitters.present?
    return @tweet
  end

  private


  def retweet
    @close_twitters.each do |twitter_name|
      client = twitter_client_start(twitter_name)
      # retweet returns an array even with scalar parameters
      client.retweet(@tweet.id).first
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
