class User < ApplicationRecord
  self.abstract_class = true
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  MOBILE_REGEX = /\A((\+|00)966\d{9}|05\d{8})\z/.freeze
  PASSWORD_FORMAT = /\A(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[.#?!@$%^&*-]).{8,}$\z/.freeze

  mount_uploader :avatar, AvatarUploader

  validates :email, :mobile, presence: true
  validates :email, :mobile, uniqueness: true
  validates :mobile, :mobile, uniqueness: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :mobile, format: { with: MOBILE_REGEX }
  validates :password, confirmation: true
  validates :password, format: { with: PASSWORD_FORMAT }, on: :create
  validates :password, allow_nil: true, format: { with: PASSWORD_FORMAT }, on: :update

  # Instance Methods
  def auth_token(type)
    JsonWebToken.encode({ id: id, type: type })
  end

  def user_type
    type
  end
end
