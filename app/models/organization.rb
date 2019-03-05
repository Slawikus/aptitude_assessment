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
end
