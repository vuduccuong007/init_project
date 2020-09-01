class User < ApplicationRecord
  USER_PERMIT = %i(name email password password_confirmation).freeze

  attr_accessor :remember_token

  validates :name, presence: true,
    length: {maximum: Settings.user.validate.name_max}
  validates :email, presence: true,
    length: {maximum: Settings.user.validate.email_max},
    format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :password, presence: true,
    length: {minimum: Settings.user.validate.pass_min}

  has_secure_password

  before_save :downcase_email

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  private

  def downcase_email
    email.downcase!
  end
end
