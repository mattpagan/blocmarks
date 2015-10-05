class Bookmark < ActiveRecord::Base
  mount_uploader :image, BookmarksUploader
  belongs_to :topic
  belongs_to :user

  validates :url, presence: true
end
