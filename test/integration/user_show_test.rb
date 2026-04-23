require "test_helper"

  class UsersShowTest < ActionDispatch::IntegrationTest

    def setup
      @inactive_user  = users(:inactive)
      @activated_user = users(:archer)
    end

    # 無効なユーザーの場合、リダイレクトされることをテスト
    test "should redirect when user not activated" do
      get user_path(@inactive_user)
      assert_response      :redirect      # または 302
      assert_redirected_to root_url       # トップページへ
    end

    # 有効なユーザーの場合、正常に表示されることをテスト
    test "should display user when activated" do
      get user_path(@activated_user)
      assert_response :success            # または 200
      assert_template 'users/show'        # プロフィールページ
    end
  end