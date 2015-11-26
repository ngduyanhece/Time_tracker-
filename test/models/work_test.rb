require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "work should not save with no associated user" do 
    work = Work.first
    assert work.valid?
    work.user_id = nil
    assert_not work.valid?
  end
end
