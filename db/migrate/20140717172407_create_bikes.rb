class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :bi_id, null: false
      t.string :bi_url, null: false
      t.string :bi_api_url, null: false
      t.integer :year
      t.string :manufacturer
      t.string :model
      t.string :serial
      t.string :color
      t.text :description
      t.integer :stolen_record_id, null: false
      t.timestamp :date_stolen
      t.string :stolen_location
      t.timestamp :date_recovered
      t.text :recovery_story
      t.string :tweet_text
      t.string :thumb
      t.string :photo
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
