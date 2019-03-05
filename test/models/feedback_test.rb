require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'it has following attributes' do
    expected_attributes =
      %w[id quality age_group nps status experienced_at created_at updated_at branch_id]

    assert_equal expected_attributes, Feedback.column_names
  end
end
