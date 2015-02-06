require 'test_helper'
class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    name = "Example User"
    email = "user@example.com" password = "password"
    assert_no_difference 'User.count' ,1 do
       post_via_redirect users_path, user: { name:  "",
                              email: "email",
                              password: password,
                              password_confirmation: password }
    end
    assert_template 'users/new'
  end
end
