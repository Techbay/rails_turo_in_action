require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  @@ptitle = "Ruby on Rails Tutorial Sample App"
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title",@@ptitle
  end
  
  test "should get help" do
    get :help
    assert_response :success
    assert_select "title","Help | "+@@ptitle
  end  
  
  test "should get about" do 
    get :about
    assert_response :success
    assert_select "title","About | "+@@ptitle
  end
  
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title","Contact | "+@@ptitle
  end
end
