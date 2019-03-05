require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  test 'it has following attributes' do
    assert_equal %w[id name created_at updated_at organization_id], Branch.column_names
  end
end
