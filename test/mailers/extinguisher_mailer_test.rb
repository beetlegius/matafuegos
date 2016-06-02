require 'test_helper'

class ExtinguisherMailerTest < ActionMailer::TestCase
  test "alert" do
    mail = ExtinguisherMailer.alert
    assert_equal "Alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
