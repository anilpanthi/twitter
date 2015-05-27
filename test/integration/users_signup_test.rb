require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid sign up information" do
    get signup_path
    assert_no_difference 'User.count' do
    post_via_redirect users_path, user: {name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password" }
    end
   assert_template 'users/show'
  end
end
