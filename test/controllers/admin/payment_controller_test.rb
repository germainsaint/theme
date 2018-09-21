require 'test_helper'

class Admin::PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get stripe" do
    get admin_payment_stripe_url
    assert_response :success
  end

  test "should get paypal" do
    get admin_payment_paypal_url
    assert_response :success
  end

end
