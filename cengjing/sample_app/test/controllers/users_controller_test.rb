require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    #assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
  end
  test "should get Signup" do
    get :new
    assert_response :success
    assert_select "title", "Sign up | Ruby on Rails Tutorial Sample App"
  end
end
