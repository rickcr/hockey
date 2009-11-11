require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    #@team = Team.find(":one")
    team = teams(:one).name 
    print "team = #{team}"
    assert_not_nil team
  end
end
