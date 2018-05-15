# frozen_string_literal: true

class Feedback < ActiveRecord::Base
  belongs_to :branch
end
