require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  test 'it has following attributes' do
    assert_equal %w[id name created_at updated_at organization_id], Branch.column_names
  end

  test 'it has number of associated feedbacks' do
    organization = Organization.create(name: 'Some organisation')
    branch = Branch.create(name: 'Some branch', organization: organization)

    Feedback.create(branch: branch, quality: 1)
    Feedback.create(branch: branch, quality: 2)

    assert_equal 2, branch.feedbacks.count
  end

  test 'returns number of feedbacks for given branch' do
    organization = Organization.create(name: 'Some organisation')
    branch = Branch.create(name: 'Some branch', organization: organization)

    Feedback.create(branch: branch, quality: 1)
    Feedback.create(branch: branch, quality: 2)

    assert_equal 2, branch.feedbacks_count
  end
end
