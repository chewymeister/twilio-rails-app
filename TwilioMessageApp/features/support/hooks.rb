Before('@signed_in') do |scenario| 
  User.create email: 'test@test.com', password: 'password', password_confirmation: 'password'
  visit root_path
  sign_in 'test@test.com', 'password'
end