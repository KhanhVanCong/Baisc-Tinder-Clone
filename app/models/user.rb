class User < ApplicationRecord
  has_one_attached :avatar

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18,
                                                  less_than_or_equal_to: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :avatar, presence: true

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine::cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  def avatar_as_thumbnail
    avatar.variant(resize_to_limit: [300, 300]).processed
  end
end
