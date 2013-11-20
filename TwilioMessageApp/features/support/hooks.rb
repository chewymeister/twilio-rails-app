Before('@signed_in') do |scenario| 
  visit root_path
  sign_in 'test@test.com', 'password'
end

Before '@registered_user' do
  User.create( email: 'test@test.com',
               password: 'password', 
               password_confirmation: 'password' )
end