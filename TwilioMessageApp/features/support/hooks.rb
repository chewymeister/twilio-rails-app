Before '@registered_user' do
  User.create( email: 'test@test.com',
               password: 'password', 
               password_confirmation: 'password' )
end
