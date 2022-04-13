require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:david)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create or sign up user" do
    assert_difference("User.count") do
      post users_url, params: { user: { first_name: "lorem", last_name: "tran",
                                        "email": "lorem@test.com", age: 19,
                                        password: "password1", password_confirmation: "password1",
                                        avatar: fixture_file_upload("avatar_test.jpeg", "image/jpeg")} }
    end
    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    post login_path, params: { session: { email: @user.email, password: 'password1' } }
    assert_redirected_to root_path
    patch user_url(@user), params: { user: { age: 27, password: "password1" } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    post login_path, params: { session: { email: @user.email, password: 'password1' } }
    assert_redirected_to root_path
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_path
  end
end
