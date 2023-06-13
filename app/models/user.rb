class User < ApplicationRecord
  has_many :attempts

  def tests_with_level(level)
    Attempt.where(user: self).joins(:test).where(tests: { level: }).map(&:test).uniq
  end
end
