require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_index_url
    assert_response :success
  end

  test "should get add" do
    get admin_users_add_url
    assert_response :success
  end

  test "should get delete" do
    get admin_users_delete_url
    assert_response :success
  end

  test "should get new" do
    get admin_users_new_url
    assert_response :success
  end

  test "should get update" do
    get admin_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_users_destroy_url
    assert_response :success
  end

end
