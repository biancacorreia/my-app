class Entry < ApplicationRecord
  OCCASIONS = [ "Work", "Evening Out", "Special Event", "Casual", "Date Night", "Sport", "Travel" ].freeze

  validates :fragrance_name, presence: true,
                             length: { maximum: 100 },
                             format: { without: /<[^>]+>/, message: "must not contain HTML" }

  validates :brand, length: { maximum: 100 },
                    format: { without: /<[^>]+>/, message: "must not contain HTML" },
                    allow_blank: true

  validates :notes, length: { maximum: 1000 },
                    format: { without: /<[^>]+>/, message: "must not contain HTML" },
                    allow_blank: true

  validates :occasion, inclusion: { in: OCCASIONS, message: "is not a valid occasion" },
                       allow_blank: true

  validates :strength, presence: true, inclusion: { in: 1..10 }

  validates :worn_on, presence: true

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
