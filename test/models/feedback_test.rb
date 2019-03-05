require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'it has following attributes' do
    expected_attributes =
      %w[id quality age_group nps status experienced_at created_at updated_at branch_id]

    assert_equal expected_attributes, Feedback.column_names
  end

  test '::feedbacks_by_branch returns number of feedbacks for branch' do
    feedbacks_count = 3

    organization = Organization.create(name: 'Some organisation')
    branch = Branch.create(name: 'Some branch', organization: organization)

    feedbacks_count.times { Feedback.create(branch: branch, quality: 1) }

    assert_equal feedbacks_count, Feedback.feedbacks_by_branch(branch.id)
  end


  test '::feedbacks_by_branch feedbacks for other branchs' do
    feedbacks_count = 3

    organization = Organization.create(name: 'Some organisation')
    branch = Branch.create(name: 'Some branch', organization: organization)

    feedbacks_count.times { Feedback.create(branch: branch, quality: 1) }

    another_branch = Branch.create(name: 'Other branch', organization: organization)
    Feedback.create(branch: another_branch, quality: 1)
    Feedback.create(branch: another_branch, quality: 2)

    assert_equal feedbacks_count, Feedback.feedbacks_by_branch(branch.id)
  end
end
