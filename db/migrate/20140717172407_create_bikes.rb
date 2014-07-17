class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :bi_id
      t.string :bi_url
      t.integer :year
      t.string :manufacturer
      t.string :model
      t.string :serial
      t.string :color
      t.text :description
      t.timestamp :date_stolen
      t.string :stolen_location
      t.timestamp :date_recovered
      t.text :recovery_story
      t.timestamps
    end
  end
end
