# model User
class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  has_many :orders
  # before_save { self.email = email.downcase }

  validates :username, presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 50 }
  # check code by stack over-flow
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { mininum: 10, maximum: 100 },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  # upload image

  mount_uploader :avatar, AvatarUploader

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
end
