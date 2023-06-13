class Test < ApplicationRecord
  belongs_to :category

  class << self
    def with_category(title)
      joins(:category).where(category: { title: }).order(title: :desc).map(&:title)
    end
  end
end
