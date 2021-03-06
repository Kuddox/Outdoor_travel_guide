require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: attractions(:one)
    assert_response :success
  end

  test "should get index when not logged in" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  test "should get edit" do
    get :edit, id: attractions(:one)
    assert_response :success
  end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
