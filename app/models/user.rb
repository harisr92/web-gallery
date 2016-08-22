class User < ApplicationRecord
  before_save :downcase
  has_attached_file :avatar, :styles => { :medium => "200x200", :thumb => "100x100" }, :default_url => "missing.jpg"
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  private
    def downcase
      self.email.downcase
    end
end
