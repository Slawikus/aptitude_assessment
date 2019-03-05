# frozen_string_literal: true

class Organization < ActiveRecord::Base
  has_many :branches
  has_many :feedbacks, through: :branches

  def quality_frequency_distribution
    feedbacks.group(:quality).count
  end

  def branch_ranking_by_average_quality
    branches.sort_by(&:average_quality).reverse
  end

  def net_promoter_score
    total = feedbacks.count

    promoters_count = feedbacks.where('quality >= 9').count
    detractors_count = feedbacks.where('quality <= 6').count

    promoters_percent = promoters_count.to_f / total.to_f * 100
    detractors_percent = detractors_count.to_f / total.to_f * 100

    promoters_percent - detractors_percent
  end
end
