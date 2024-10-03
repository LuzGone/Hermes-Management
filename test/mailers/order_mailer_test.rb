require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "order_updated_notification" do
    mail = OrderMailer.order_updated_notification
    assert_equal "Order updated notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
