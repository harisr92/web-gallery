class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image
  scope :feed, -> { order(created_at: :desc) }
  validates :content, presence: true, length: {maximum:150}
end
