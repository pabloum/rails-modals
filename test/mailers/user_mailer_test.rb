require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'invite' do
    # Guardamos el email para futuros assertions
    email = UserMailer.create_invite('me@example.com', 'friend@example.com', Time.now)

    # Enviar el email y verificar que fue encolado
    assert_emails 1 do
      email.deliver_now
    end

    # Verificar que el contenido es el esperado
    assert_equal ['me@example.com'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'You are being invited by me@example.com', email.subject
    # assert_equal read_fixture('invite').join, email.body.to_s

  end

end
