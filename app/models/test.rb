class Test < ApplicationRecord
  belongs_to :category
  has_many :attempts

  class << self
    def with_category(title)
      joins(:category).where(category: { title: }).order(title: :desc).pluck(:title)
    end
  end
end
