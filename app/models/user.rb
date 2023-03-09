require 'bcrypt'

class User < ActiveRecord::Base
  has_many :pets

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
