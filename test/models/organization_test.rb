require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test 'it has following attributes' do
    expected_attributes = %w[id name created_at updated_at]

    assert_equal expected_attributes, Organization.column_names
  end

  test 'computes quality frequency distribution for organization' do
    organization = Organization.create(name: 'Some organisation')

    branch_1 = Branch.create(name: 'Some branch', organization: organization)
    Feedback.create(branch: branch_1, quality: 1)
    Feedback.create(branch: branch_1, quality: 4)

    branch_2 = Branch.create(name: 'Another branch', organization: organization)
    Feedback.create(branch: branch_2, quality: 4)
    Feedback.create(branch: branch_2, quality: 5)

    expected_distribution = { 1 => 1, 4 => 2, 5 => 1 }

    assert_equal expected_distribution, organization.quality_frequency_distribution
  end

  test 'it computes average  quality ranking for all branches' do
    organization = Organization.create(name: 'Some organisation')

    branch_1 = Branch.create(name: 'Some branch', organization: organization)
    Feedback.create(branch: branch_1, quality: 1)
    Feedback.create(branch: branch_1, quality: 4)
    Feedback.create(branch: branch_1, quality: 1)

    branch_2 = Branch.create(name: 'Another branch', organization: organization)
    Feedback.create(branch: branch_2, quality: 4)
    Feedback.create(branch: branch_2, quality: 5)

    expected_distribution = [branch_2, branch_1]

    assert_equal expected_distribution, organization.branch_ranking_by_average_quality
  end
end
