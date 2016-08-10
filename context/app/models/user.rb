class User < ApplicationRecord

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  attr_accessor :password
  attr_accessor :password_confirmation

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: EMAIL_REGEX }

  validates :password, presence: true,
                       confirmation: true,
                       if: :password

  validates :password_confirmation, presence: true,
                                    if: :password_confirmation

  validates :name, length: { maximum: 100 }

  validate :validate_name_format

  before_validation :set_fake_name
  before_save       :before_save_hash_password

  def self.authenticate!(email:, password:)
    user = find_by(email: email)

    if user&.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end

  # def email
  #   "User email: #{read_attribute(:email)}"
  # end
  #
  # def email=(value)
  #   write_attribute(:email, value)
  # end

  private

  def set_fake_name
    self.name = FFaker::Name.name unless name.present?
  end

  def before_save_hash_password
    if @password.present?
      self.salt            = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(@password, salt)
    end
  end

  def validate_name_format
    errors.add :name, :invalid_name_format unless correct_name?
  end

  def correct_name?
    name.split(/\W/).map{ |name_word| name_word[0] }.join[/[A-Z]{2}/].present?
  end

end
