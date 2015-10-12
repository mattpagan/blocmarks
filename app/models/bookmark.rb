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
#  title      :string
#

class Bookmark < ActiveRecord::Base
  mount_uploader :image, BookmarksUploader

  has_many :likes, dependent: :destroy

  belongs_to :topic
  belongs_to :user

  validates :url, presence: true
  # validates :title, length: { in: 5..50}
end
