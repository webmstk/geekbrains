class User < ApplicationRecord

  attr_accessor :password
  attr_accessor :password_confirmation

  before_save :before_save_hash_password

  def self.authenticate!(email:, password:)
    user = find_by(email: email)

    if user&.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end

  private

  def before_save_hash_password
    if @password.present?
      self.salt            = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(@password, salt)
    end
  end

end
