# frozen_string_literal: true

class Branch < ActiveRecord::Base
  belongs_to :organization
  has_many :feedbacks
end
