class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  def self.max_answers
    4
  end

  validates :body, presence: true
end
