require "test_helper"

class ItemtestControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get itemtest_new_url
    assert_response :success
  end

  test "should get create" do
    get itemtest_create_url
    assert_response :success
  end

  test "should get update" do
    get itemtest_update_url
    assert_response :success
  end

  test "should get edit" do
    get itemtest_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get itemtest_destroy_url
    assert_response :success
  end

  test "should get index" do
    get itemtest_index_url
    assert_response :success
  end

  test "should get show" do
    get itemtest_show_url
    assert_response :success
  end
end
