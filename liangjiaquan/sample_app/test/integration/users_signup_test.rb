require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "", email: "user@invalid", 
        password: "", password_confirmation: "bar"}
      end
      assert_template 'users/new'
      # execise 7.2
      assert_select 'div#<CSS id for error explanation>'
      assert_select 'div.<CSS class for field with error>'
  end
  
  test "valid signup information" do
    get signup_path
    name = "Example User"
    email = "user@example.com"
    password = "password"
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, 
      user: { name: name, email: email, password: password, password_confirmation: password }
    end 
    assert_template 'users/show'
		assert is_logged_in?
    # execise 7.3
    # unfinished!
    assert_not flash.empty?
  end

end
