require 'rails_helper'

RSpec.describe RecoveriesController, :type => :controller do
  describe 'GET index' do
    it "populates an array of bikes" do
      bike = FactoryGirl.create(:bike_stolen_test)
      get :index
      expect(assigns(:bikes)).to match_array([bike])
    end
  end
end
