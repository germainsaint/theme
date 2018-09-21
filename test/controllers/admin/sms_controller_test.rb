require 'test_helper'

class Admin::SmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sms_index_url
    assert_response :success
  end

  test "should get send" do
    get admin_sms_send_url
    assert_response :success
  end

end
