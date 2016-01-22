require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:exemplo)
    @non_admin = users(:exemplo2)
  end

  # test "index as admin including pagination and delete links" do 
  #   log_in_as(@admin)
  #   get users_path
  #   assert_template 'users/index'
  #   assert_select 'div.pagination'
  #   first_page_of_users = User.paginate(page: 1)
  #   first_page_of_users.each do |user|
  #     assert_select('a[href=?]', user_path(user), text: user.name)
  #     unless user == @admin
  #       assert_select('a[href=?]', user_path(user), text: delete, 
  #                                                   method: :delete)
  #     end
  #   end

  #   assert_difference 'User.count', -1 do
  #     delete user_path(@non_admin)
  #   end
  # end

  # test "index as nom-admin" do
  #   log_in_as(@nom_admin)
  #   get users_path
  #   assert_select 'a', text: 'delete', count: 0
  # end

end
