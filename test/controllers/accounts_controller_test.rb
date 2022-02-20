require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    post account_session_url, params: {email:"lol@gmail.com", password:"123456", remember_me: 0}
    get accounts_index_url
    assert_response :success
  end

  test "should get show" do
    post account_session_url, params: {email:"lol@gmail.com", password:"123456", remember_me: 0}
    get '/profile/senyca'
    assert_response :success
  end
end
