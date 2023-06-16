class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  scope :all_correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:answers) if question.answers.size >= Question.max_answers
  end
end
