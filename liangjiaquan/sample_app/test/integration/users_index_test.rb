require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
	def setup
		@user = users(:michael)
		@non_admin = users(:archer)
	end

	test "index as admin including pagination and delete link" do
		#log_in_as(@admin0)
	end

	test "index as non-admin" do
		log_in_as(@non_admin)
		get users_path
		assert_select 'a', text: 'delete', count: 0
	end

	test "index including pagination" do
		log_in_as(@user)
		get users_path
		assert_template 'users/index'
		assert_select 'div.pagination'
		User.paginate(page: 1).each do |user|
			assert_select 'a[href=?]', user_path(user), text: user.name
		end
	end
end
