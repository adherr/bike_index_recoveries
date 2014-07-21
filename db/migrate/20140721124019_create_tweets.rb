class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer  "twitter_account_id"
      t.integer  "twitter_tweet_id",   limit: 8
      t.integer  "bike_id"
      t.timestamps
    end
    add_index "tweets", ["twitter_account_id"], name: "index_tweets_on_twitter_account_id", using: :btree
  end
end
