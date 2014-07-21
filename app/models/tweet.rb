class Tweet < ActiveRecord::Base
  belongs_to :twitter_account
  belongs_to :bike
  #has_many :retweets

  validates :twitter_account_id, presence: true
  validates :bike_id, presence: true
end
