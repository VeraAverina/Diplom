require "test_helper"

class TestexecstepControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get testexecstep_new_url
    assert_response :success
  end

  test "should get create" do
    get testexecstep_create_url
    assert_response :success
  end

  test "should get update" do
    get testexecstep_update_url
    assert_response :success
  end

  test "should get edit" do
    get testexecstep_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get testexecstep_destroy_url
    assert_response :success
  end

  test "should get index" do
    get testexecstep_index_url
    assert_response :success
  end

  test "should get show" do
    get testexecstep_show_url
    assert_response :success
  end
end
