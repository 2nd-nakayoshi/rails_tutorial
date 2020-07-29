require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "test", email: "test@2ndwave.jp")
  end

  def "should be valid" do
    assert @user.valid?
  end


end
