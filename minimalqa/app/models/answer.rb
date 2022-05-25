class Answer < ApplicationRecord
  validates :body, presence: true, length: { maximum: 300 }
  belongs_to :user
  belongs_to :question
  has_many :reactions, dependent: :destroy
end
