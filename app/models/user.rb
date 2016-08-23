class User < ApplicationRecord
  has_many :images, dependent: :destroy
  before_save :downcase
  has_attached_file :avatar, :styles => { :medium => "200x200", :thumb => "100x100" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  def feed
    Image.where("user_id = ?", id)
  end

  private
    def downcase
      self.email.downcase
    end
end
