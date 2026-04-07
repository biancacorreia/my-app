class Entry < ApplicationRecord
  validates :fragrance_name, presence: true
  validates :strength, presence: true, inclusion: { in: 1..10 }
  validates :worn_on, presence: true

  OCCASIONS = [ "Work", "Evening Out", "Special Event", "Casual", "Date Night", "Sport", "Travel" ].freeze

  scope :recent, -> { order(worn_on: :desc) }
  scope :this_week, -> { where(worn_on: 1.week.ago..) }

  def self.favorite_occasion
    where.not(occasion: [ nil, "" ])
      .group(:occasion)
      .order("count_all DESC")
      .count
      .first&.first
  end

  def self.avg_strength
    average(:strength)&.round(1)
  end
end
