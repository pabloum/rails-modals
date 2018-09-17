class UsersController < ApplicationController

  def invite_friend
    from_email = current_user.email
    email = UserMailer.create_invite('me@example.com', params[:email], Time.now)
    email.deliver_now
  end

end
