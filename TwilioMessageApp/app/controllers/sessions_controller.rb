class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
    flash[:notice] = "Welcome test@test.com! Choose a valid mobile number to send a text message to!"
  end
end