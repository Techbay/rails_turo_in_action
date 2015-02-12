require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
  	ActionMailer::Base.deliveries.clear
  end
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
      assert_select 'div#error_explanation'
      assert_select 'div.field_with_errors'
  end
  
  test "valid signup information with account activation" do
    get signup_path
    name = "Example User"
    email = "user@example.com"
    password = "password"
    assert_difference 'User.count', 1 do
      post users_path, 
      user: { name: name, email: email, password: password, password_confirmation: password }
    end 
		assert_equal 1, ActionMailer::Base.deliveries.size
		user = assigns(:user)
		assert_not user.activated?
		log_in_as(user)
		assert_not is_logged_in?
		get edit_account_activation_path("invalid token")
		assert_not is_logged_in?
		get edit_account_activation_path(user.activation_token, email: 'wrong')
		assert_not is_logged_in?
		get edit_account_activation_path(user.activation_token, email: user.email)
		assert user.reload.activated?
		follow_redirect!
		assert_template 'users/show'
		assert is_logged_in?
    # assert_template 'users/show'
		# assert is_logged_in?
    # execise 7.3
    # unfinished!
    # assert_not flash.empty?
  end

end
