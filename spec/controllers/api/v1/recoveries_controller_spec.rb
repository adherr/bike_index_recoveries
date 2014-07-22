require 'rails_helper'

RSpec.describe Api::V1::RecoveriesController, type: :controller do
  describe 'create' do
    before(:each) do
      @tti = double(TwitterTweeterIntegration, create_tweet: "Fake tweeting...")
      allow(TwitterTweeterIntegration).to receive(:new).and_return(@tti)
    end

    context "with no key" do
      it "should respond not authorized" do
        post :create, {}, format: :json
        expect(response.code).to eq("401")
      end
    end
    context "with wrong key" do
      it "should respond not authorized" do
        post :create, {key: "asdfjaba90736flkjnva.1q5nasf"}, format: :json
        expect(response.code).to eq("401")
      end
    end
    context "with proper key" do
      it "should create a new Bike in the db and fill it with the correct info" do
        VCR.use_cassette('bikeindex', :record => :new_episodes) do
          post_params = {key: ENV['INCOMING_REQUEST_KEY'], api_url: "https://bikeindex.org/api/v1/bikes/3414", theft_information: {stolen_record_id: 1, date_stolen: "2014-05-20T01:00:00-05:00", location: "Chicago, IL"}, recovery_information: {date_recovered: "2014-01-29T11:05:17-06:00", recovery_story: nil, tweet: nil}}
          expect(TwitterTweeterIntegration).to_not receive(:new)
          expect { post :create, post_params, format: :json }.to change{Bike.count}.by(1)
          expect(response.code).to eq("200")
          expect(b = Bike.find_by(bi_id: 3414)).to be_a(Bike)
          expect(b.date_recovered).to eq(Date.parse("2014-01-29T11:05:17-06:00"))
          expect(b.year).to eq(2014)
          expect(b.model).to eq("Allegro Comp Disc")
        end
      end
      it "should share on facebook and twitter if there is a story and tweet" do
        VCR.use_cassette('bikeindex', :record => :new_episodes) do
          post_params = {key: ENV['INCOMING_REQUEST_KEY'], api_url: "https://bikeindex.org/api/v1/bikes/3414", theft_information: {stolen_record_id: 1, date_stolen: "2014-05-20T01:00:00-05:00", location: "Chicago, IL"}, recovery_information: {date_recovered: "2014-01-29T11:05:17-06:00", recovery_story: "I Got this bike back because the bike index is awesome! Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non", tweet: "I Got this bike back because the bike index is awesome!"}}
          expect(TwitterTweeterIntegration).to receive(:new).with(an_instance_of(Bike))
          expect(@tti).to receive(:create_tweet)
          expect(FacebookPosterIntegration).to receive(:new).with(an_instance_of(Bike)).and_return(double(:FacebookPosterIntegration, create_post: "fake FB post"))
          post :create, post_params, format: :json
          expect(response.code).to eq("200")
        end
      end
    end
  end

  describe 'bike_index_response' do
    it "should get the bike's hash from the BI api" do
      VCR.use_cassette('bikeindex', :record => :new_episodes) do
        bike_hash = Api::V1::RecoveriesController.new.bike_index_response("https://bikeindex.org/api/v1/bikes/3414")
        expect(bike_hash[:serial]).to eq("stolen_serial_number")
        expect(bike_hash[:front_tire_narrow]).to be true
      end
    end
  end

end
