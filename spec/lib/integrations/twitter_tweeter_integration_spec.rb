require 'rails_helper'

describe TwitterTweeterIntegration do
  before(:all) do
    VCR.use_cassette('geocoding', record: :new_episodes) do
      Rails.application.load_seed if TwitterAccount.all.empty?
      @chi_bike = Bike.find_by(stolen_record_id: 1358) || FactoryGirl.create(:bike_stolen_test_story)
    end
    @tti = TwitterTweeterIntegration.new(@chi_bike)
  end

  describe 'initialize' do
    it "should find the Chicago twitter for a bike recovered in Chicago" do
      expect(@tti.instance_variable_get(:@close_twitters)).to match_array([TwitterAccount.find_by(address: "Chicago, IL")])
    end
  end

  describe 'create_tweet' do
    it "should create a tweet and retweets" do
      VCR.use_cassette('twitter', record: :none) do
        tweet = @tti.create_tweet
        expect(tweet.full_text).to eq("I Got this bike back because the bike index is awesome!")
      end
    end
  end

  describe 'twitter_client_start' do
    it "should return a Twitter::REST::Client with appropriate keys" do
      default_twitter = TwitterAccount.find_by(screen_name: 'bikeindex')
      client = @tti.send(:twitter_client_start, default_twitter)
      expect(client).to be_a(Twitter::REST::Client)
      expect(client.access_token_secret).to_not be_nil
    end
  end
end
