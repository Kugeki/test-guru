class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", optional: true

  has_many :attempts

  class << self
    def with_category(title)
      joins(:category).where(category: { title: }).order(title: :desc).pluck(:title)
    end
  end
end
