require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
      @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      sign_in @user
    get :index
    assert_response :success

  end

  test "should get show" do
      @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      @trip = Trip.create!({:name => "testname", :user_id => @user.id})
      sign_in @user
    get :show, {:id => @trip.id}
    assert_response :success

  end

  test "should get new" do
    @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      sign_in @user
    get :new
    assert_response :success

  end

  # test "should get create" do
  #   @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
  #   sign_in @user
  #   trip_params = {:name => "test", :user_id => @user.id}
  #   get :create
  #   assert_response :success

  # end

  test "should get edit" do
      @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      @trip = Trip.create!({:name => "testname", :user_id => @user.id})
      sign_in @user
    get :edit, {:id => @trip.id}
    assert_response :success

  end

  #  test "should get update" do
  #     @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
  #     @trip = Trip.create!({:name => "testname", :user_id => @user.id})
  #     sign_in @user
  #   get :update, {:id => @trip.id}
  #   assert_response :success

  # end

    test "should get desroy" do
      @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      @trip = Trip.create!({:name => "testname", :user_id => @user.id})
      sign_in @user
    get :destroy, {:id => @trip.id}
    assert_response :redirect
    

  end

  test "should get export_trip" do
      @user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})
      @trip = Trip.create!({:name => "testname", :user_id => @user.id})
      sign_in @user
    get :export_trip, {:id => @trip.id}
    assert_response :redirect

  end



end
