require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Outdoor Travel Guide (unofficial)"
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
