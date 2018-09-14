class UserMailer < ApplicationMailer

  def create_invite(from, to, time)
    @from = from
    mail(from: from, to: to, subject: 'You are being invited by ' + from)
    # send(from,)
  end

  # def deliver_now(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Bienvenido a mi super sitio!')
  # end

end
