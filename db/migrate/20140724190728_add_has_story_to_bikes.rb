class AddHasStoryToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :has_story, :boolean
  end
end
