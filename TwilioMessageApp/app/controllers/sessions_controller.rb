class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
    # if current_user
      flash[:notice] = "Welcome #{@user.email}! Choose a valid mobile number to send a text message to!"
    # else
      # flash[:error] = ["Your email or password did not match. Please try again"]
    # end
  end
end