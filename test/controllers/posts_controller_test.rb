require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    post account_session_url, params: {email:"lol@gmail.com", password:"123456", commit: "Войти"}
    get dashboard_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  # test "should create post" do
  #   assert_difference("Post.count") do
  #     post posts_url, params: { post: {  } }
  #   end

  #   assert_redirected_to post_url(Post.last)
  # end

  test "should show post" do
    post account_session_url, params: {email:"lol@gmail.com", password:"123456", remember_me: 0}
    get '/profile/senyca'
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_post_url(@post)
  #   assert_response :success
  # end

  # test "should update post" do
  #   patch post_url(@post), params: { post: {  } }
  #   assert_redirected_to post_url(@post)
  # end

  # test "should destroy post" do
  #   assert_difference("Post.count", -1) do
  #     delete post_url(@post)
  #   end

  #   assert_redirected_to posts_url
  # end
end