require 'rails_helper'

describe Tweet do
  describe 'validations' do
    it { should validate_presence_of :twitter_account_id }
    it { should validate_presence_of :bike_id }
    #it { should have_many :retweets}
    it { should belong_to :bike }
    it { should belong_to :twitter_account }
  end
end
