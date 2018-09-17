require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:pumo)
  end

  test "invite friend" do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post invite_friend_url, params: { email: 'friend@example.com' }
    end
    invite_email = ActionMailer::Base.deliveries.last
    
    assert_equal "You are being invited by me@example.com", invite_email.subject
    assert_equal 'friend@example.com', invite_email.to[0]
    # assert_match(/Hola friend@example.com/, invite_email.body.to_s)
  end
end
=begin

test "invite friend" do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post invite_friend_url, params: { email: 'friend@example.com' }
    end
    invite_email = ActionMailer::Base.deliveries.last

    assert_equal "You have been invited by jc@example.com", invite_email.subject
    assert_equal 'friend@example.com', invite_email.to[0]
    assert_match(/Estas siendo invitado a nuestra aplicación por jc@example.com/, invite_email.body.to_s)
  end

crear ruta
construir método que llama
mailer invite que  se usa dentro de invite_friend

=end
