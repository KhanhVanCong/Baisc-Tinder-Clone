require "test_helper"

class LikeUnlikeTest < ActionDispatch::IntegrationTest
  def setup
    @user_david = users(:david)
    @user_hana = users(:hana)
  end

  test "like and unlike the other user" do
    post login_path, params: { session: { email: @user_david.email, password: 'password1' } }
    assert_redirected_to root_path

    assert_not @user_david.like?(@user_hana)
    @user_david.like(@user_hana)
    assert @user_david.like?(@user_hana)
    assert @user_hana.likers.include?(@user_david)

    @user_david.unlike(@user_hana)
    assert_not @user_david.like?(@user_hana)
    assert_not @user_hana.likers.include?(@user_david)
  end
end
