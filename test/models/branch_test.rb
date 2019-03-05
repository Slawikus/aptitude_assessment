require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  def setup
    @organization = Organization.create(name: 'Some organisation')
    @branch = Branch.create(name: 'Some branch', organization: organization)

    Feedback.create(branch: branch, quality: 1)
    Feedback.create(branch: branch, quality: 2)
  end

  test 'it has following attributes' do
    assert_equal %w[id name created_at updated_at organization_id], Branch.column_names
  end

  test 'it has number of associated feedbacks' do
    assert_equal 2, branch.feedbacks.count
  end

  test 'returns number of feedbacks for given branch' do
    assert_equal 2, branch.feedbacks_count
  end

  test 'it computes average quality for given branch' do
    Feedback.create(branch: branch, quality: 6)
    Feedback.create(branch: branch, quality: 7)

    assert_in_delta (1.0 + 2.0 + 6.0 + 7.0) / 4.0, branch.average_quality
  end

  private

  attr_reader :organization, :branch
end
