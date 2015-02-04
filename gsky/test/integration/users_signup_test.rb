require 'test_helper'


class UsersSignupTest < ActionDispatch::IntegrationTest
  
  #确认点击注册按钮提交无效数据后,不会创建新用户
  test "invalid signup information " do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user:{name: "", email:"user@invalid",password:"foo",password_confirmation:"bar"}
    end
    assert_template 'users/new' #检查是否会重新渲染new动作.
  end

  #测试注册成功.
  test "valid signup information" do
    get signup_path
	name = "Example User"
	email = "user@example.com" 
	password = "password" 
	
	assert_difference 'User.count', 1 do
    post_via_redirect users_path, user: { name:  name,  email: email,password:password
											password_confirmation: password }
	end
	assert_template 'users/show' 
	end

end
