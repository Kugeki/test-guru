class User < ApplicationRecord
  has_many :attempts
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id"
  has_many :attempted_tests, through: :attempts, source: :test

  validates :nickname, presence: true
  validates :email, presence: true

  def tests_with_level(level)
    Test.joins(:attempts).where(attempts: { user: self }, level:)
  end
end
