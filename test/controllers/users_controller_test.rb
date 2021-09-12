require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get expulsion" do
    get users_expulsion_url
    assert_response :success
  end

end
