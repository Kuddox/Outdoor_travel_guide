require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

end
