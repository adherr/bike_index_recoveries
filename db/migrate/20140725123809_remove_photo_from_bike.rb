class RemovePhotoFromBike < ActiveRecord::Migration
  def change
    remove_column :bikes, :photo
  end
end
