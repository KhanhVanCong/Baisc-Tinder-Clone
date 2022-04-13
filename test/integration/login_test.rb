require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:david)
  end

  test "should login successfully with valid user" do
    post login_path, params: { session: { email: @user.email, password: 'password1' } }
    assert_redirected_to root_path
  end

  test "should login failed with invalid user" do
    post login_path, params: { session: { email: "lee@test.com", password: 'password1' } }
    assert_redirected_to login_path
  end
end
