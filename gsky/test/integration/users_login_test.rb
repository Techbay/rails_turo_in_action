require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)  #这数据是在固件test/fixtures/users.yml中预置的
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path , session:{email:" ", password:" "}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, session:{ email:@user.email, password:'password'}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]",login_path,count:0
    assert_select "a[href=?]",logout_path
    assert_select "a[href=?]",user_path(@user)
  end

  test "login with valid information followed by log out" do
    get login_path
    post login_path, session:{ email:@user.email, password:'password'}
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]",login_path,count:0
    assert_select "a[href=?]",logout_path
    assert_select "a[href=?]",user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    #模拟用户在另一个窗口中点击退出链接
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]",login_path
    assert_select "a[href=?]",logout_path,count:0
    assert_select "a[href=?]",user_path(@user),count:0
  end

  test "login with remembering" do
    log_in_as(@user,remember_me:'1')
    assert_not_nil cookies['remember_token']
  end

    

end
