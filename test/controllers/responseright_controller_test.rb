require "test_helper"

class ResponserightControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get responseright_view_url
    assert_response :success
  end
end
