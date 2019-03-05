# frozen_string_literal: true

class Feedback < ActiveRecord::Base
  belongs_to :branch

  class << self
    def feedbacks_by_branch(branch_id)
      where(branch_id: branch_id).count
    end
  end
end
