# frozen_string_literal: true

class Branch < ActiveRecord::Base
  belongs_to :organization
  has_many :feedbacks

  def feedbacks_count
    feedbacks.count
  end
end
