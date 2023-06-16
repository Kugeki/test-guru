class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  MAX_ANSWERS = 4
end
