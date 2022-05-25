class Question < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 250 }
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
