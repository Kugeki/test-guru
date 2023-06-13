class User < ApplicationRecord
  has_many :attempts

  def tests_with_level(level)
    Test.where(id: Attempt.where(user: self).map(&:test_id).uniq, level:)
  end
end
