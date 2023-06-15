class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers_count

  private

  MIN_ANSWERS = 1
  MAX_ANSWERS = 4

  def validate_answers_count
    errors.add(:answers) unless answers.length.between?(MIN_ANSWERS, MAX_ANSWERS)
  end
end
