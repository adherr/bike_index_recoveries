class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.string   "screen_name"
      t.float    "latitude"
      t.float    "longitude"
      t.string   "consumer_key"
      t.string   "consumer_secret"
      t.string   "user_token"
      t.string   "user_secret"
      t.string   "address"
      t.boolean  "default",         default: false
      t.timestamps
    end

    add_index "twitter_accounts", ["latitude", "longitude"], name: "index_twitter_accounts_on_latitude_and_longitude", using: :btree

  end
end
