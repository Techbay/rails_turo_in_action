ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # 登录指定用户
  def is_logged_in?
    !session[:user_id].nil?
  end

  # 登录测试用户
  def log_in_as(user,options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path,session: {
        email:user.email,
        password:password,
        remember_me: remember_me
      }
    else
      session[:user_id] = user.id
    end
  end
  # 退出当前用户
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  private
  def integration_test?
    defined?(post_via_redirect)
  end
  # Add more helper methods to be used by all tests here...
end
