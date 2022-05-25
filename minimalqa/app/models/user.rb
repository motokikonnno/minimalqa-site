class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 8 }
    has_secure_password validations: true

    has_many :questions, dependent: :destroy
    has_many :favorites, dependent: :destroy
end
