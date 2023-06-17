require "test_helper"

class TestexecControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get testexec_new_url
    assert_response :success
  end

  test "should get create" do
    get testexec_create_url
    assert_response :success
  end

  test "should get update" do
    get testexec_update_url
    assert_response :success
  end

  test "should get edit" do
    get testexec_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get testexec_destroy_url
    assert_response :success
  end

  test "should get index" do
    get testexec_index_url
    assert_response :success
  end

  test "should get show" do
    get testexec_show_url
    assert_response :success
  end
end
