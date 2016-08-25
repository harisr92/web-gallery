class Image < ApplicationRecord
  belongs_to :user
  has_many :comments
  scope :feed, -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
  has_attached_file :photo, :styles => { :medium => "200x200", :thumb => "100x100" }
  validates_attachment :photo, presence: true,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
