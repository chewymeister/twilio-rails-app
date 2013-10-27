def has_account? email
  !User.find_by_email(email).blank?
end

def sign_up email='', password='', password_confirmation=''
  fill_in "user[email]", with: email
  fill_in "user[password]", with: password
  fill_in "user[password_confirmation]", with: password_confirmation
  click_button "Sign up"
end

def sign_in email='', password=''
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  click_button 'Sign in'
end