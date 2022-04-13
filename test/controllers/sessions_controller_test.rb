require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:david)
  end

  test "login with invalid user" do
    post login_path, params: { session: { email: @user.email, password: 'asdedw' } }
    assert_redirected_to login_path
  end

  test "login with valid user" do
    post login_path, params: { session: { email: @user.email, password: 'password1' } }
    assert_redirected_to root_path
  end
end
