# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  url        :string
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  image      :string
#

class Bookmark < ActiveRecord::Base
  mount_uploader :image, BookmarksUploader
  belongs_to :topic
  belongs_to :user

  validates :url, presence: true
end
