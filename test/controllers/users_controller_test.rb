require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers
  # test "the truth" do
  #   assert true
  # end
  test "should get show" do
  	@user = User.create!({:email => "yayaya@email.com", :password => "password", :password_confirmation => "password"})


    get :show, {:id => @user.id}
    assert_response :success
    
  end

  
end
