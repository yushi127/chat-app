require 'test_helper'

class MyroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get myrooms_show_url
    assert_response :success
  end

end
