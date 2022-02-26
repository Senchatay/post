require "./test/test_helper"

class SessionFlowsTest < ActionDispatch::IntegrationTest
  test "user will registr and perform calculations" do
    password = Faker::Number.number(digits: 6)

    username= Faker::Lorem.word

    post account_session_url, params: {email: 'example@mail.ru', password: 'password', remember_me: 0}

    get dashboard_url

    assert_response :success
  end

  test "user will not registr and try to perform calculations" do
    get dashboard_url

    assert_redirected_to account_session_url
  end
end
