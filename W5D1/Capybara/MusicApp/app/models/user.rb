# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord

  validates :email, :password_digest, :session_token, presence: true
  validates :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  attr_reader :password

  def ensure_session_token
    self.session_token ||= self.generate_session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = self.generate_session_token
    self.save!
    self.session_token
  end

  def password=(input_password)
    @password = input_password
    self.password_digest = BCrypt::Password.create(input_password)
  end


  def self.find_by_credentials(input_email,input_password)
    user = User.find_by(email: input_email)
    return nil if user.nil?
    user.is_password?(input_password) ? user : nil
  end


  def is_password?(input_password)
    BCrypt::Password.new(password_digest).is_password?(input_password)
  end



end
