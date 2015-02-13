require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  # call the function before every test
  # solves execise 3.1
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  # solves execise 3.2
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
