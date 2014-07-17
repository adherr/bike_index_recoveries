require 'rails_helper'

RSpec.describe Api::V1::RecoveriesController, type: :controller do
  describe 'create' do
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
        post_params = {key: ENV['INCOMING_REQUEST_KEY'], api_url: "https://bikeindex.org/api/v1/bikes/3414", theft_information: {date_stolen: "2014-05-20T01:00:00-05:00", location: "Chicago, IL"}, recovery_information: {date_recovered: "2014-01-29T11:05:17-06:00", recovery_story: nil}}
        post :create, post_params, format: :json
        expect(response.code).to eq("200")
        expect(b = Bike.find_by(bi_id: 3414)).to be_a(Bike)
        expect(b.date_recovered).to eq(Date.parse("2014-01-29T11:05:17-06:00"))
        expect(b.year).to eq(2014)
        expect(b.model).to eq("Allegro Comp Disc")
      end
    end
  end

  describe 'bike_index_response' do
    it "should get the bike's hash from the BI api" do
      bike_hash = Api::V1::RecoveriesController.new.bike_index_response("https://bikeindex.org/api/v1/bikes/3414")
      expect(bike_hash[:serial]).to eq("stolen_serial_number")
      expect(bike_hash[:front_tire_narrow]).to be true
    end
  end

end
