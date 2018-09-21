require 'test_helper'

class Admin::TwilioControllerTest < ActionDispatch::IntegrationTest
  test "should get message" do
    get admin_twilio_message_url
    assert_response :success
  end

  test "should get send" do
    get admin_twilio_send_url
    assert_response :success
  end

end
