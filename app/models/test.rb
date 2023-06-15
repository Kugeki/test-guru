class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", optional: true
  has_many :questions

  has_many :attempts
  has_many :attempted_users, through: :attempts, source: :user

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }

  class << self
    def with_category(title)
      joins(:category).where(category: { title: }).order(title: :desc).pluck(:title)
    end
  end
end
