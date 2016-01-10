require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:                 "",
                              email:                 "user@invalid",
                              password:              "foo",
                              password_confirmation: "bar" }
    end
    assert_template "users/new"
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, user: { name:                 "Example User",
                              email:                 "user@example.com",
                              password:              "foobar",
                              password_confirmation: "foobar" }
    end
    follow_redirect!                # post_via_redirect would work as well.
    assert_template "users/show"
  end

end
