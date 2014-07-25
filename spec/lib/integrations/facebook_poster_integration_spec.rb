require 'rails_helper'

RSpec.describe "FacebookPosterIntegration" do
  before(:all) do
    VCR.use_cassette('bikeindex', record: :none) do
      @chi_bike = Bike.find_by(stolen_record_id: 1) || FactoryGirl.create(:bike_stolen_test_story)
    end
  end
  describe 'create_post' do
    it 'should call the right methods on Koala' do
      @fake_fb = double(Koala::Facebook::API, put_connections: "fake FB post" )
      allow(Koala::Facebook::API).to receive(:new).and_return(@fake_fb)
      expect(Koala::Facebook::API).to receive(:new).with(ENV['FACEBOOK_ACCESS_TOKEN'])
      expect(@fake_fb).to receive(:put_connections)
      VCR.use_cassette('facebook', record: :none) do
        FacebookPosterIntegration.new(@chi_bike).create_post
      end
    end
    it 'should actually post a thing' do
      VCR.use_cassette('facebook', record: :none) do
        fb_post = FacebookPosterIntegration.new(@chi_bike).create_post
        fb_tester = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
        fb_object_id = fb_post['id'].split('_')[1].to_i
        fb_object = fb_tester.get_object(fb_object_id)
        fb_tester.delete_object(fb_object_id)
        expect(fb_object['message']).to eq(@chi_bike.recovery_story)
      end
    end
  end
end
