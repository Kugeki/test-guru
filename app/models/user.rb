class User < ApplicationRecord
  has_many :attempts

  def tests_with_level(level)
    Test.joins(:attempts).where(attempts: { user: self }, level:)
  end
end
