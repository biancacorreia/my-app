class PagesController < ApplicationController
  def home
    @recent_entries = Entry.recent.limit(5)
    @fragrances_this_week = Entry.this_week.count
    @favorite_occasion = Entry.favorite_occasion || "N/A"
    @avg_strength = Entry.avg_strength || "N/A"
  end

  def analytics
    @total_entries = Entry.count
    @avg_strength = Entry.avg_strength || 0
    @occasions = Entry.where.not(occasion: [ nil, "" ]).group(:occasion).count
    @strength_by_occasion = Entry.where.not(occasion: [ nil, "" ])
                                  .group(:occasion)
                                  .average(:strength)
                                  .transform_values { |v| v.round(1) }
    @entries_by_month = Entry.group(Arel.sql("TO_CHAR(worn_on, 'YYYY-MM')"))
                              .order(Arel.sql("TO_CHAR(worn_on, 'YYYY-MM')"))
                              .count
  end
end
