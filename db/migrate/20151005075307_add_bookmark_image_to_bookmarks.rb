class AddBookmarkImageToBookmarks < ActiveRecord::Migration
  def change
  	add_column :bookmarks, :image, :string
  end
end
