class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
    flash[:notice] = "Welcome #{@user.email}! Choose a valid mobile number to send a text message to!"
  end

  def destroy
    super
    flash[:notice] = "Goodbye!"
  end
end