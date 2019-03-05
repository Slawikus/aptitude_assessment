# frozen_string_literal: true

class Organization < ActiveRecord::Base
  has_many :branches
  has_many :feedbacks, through: :branches

  def quality_frequency_distribution
    feedbacks.group(:quality).count
  end
end
