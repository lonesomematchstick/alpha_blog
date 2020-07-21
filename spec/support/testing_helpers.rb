module TestingHelpers

  def login(user)    
    # session[:user_id] = user.id
    # visit login_path
    # fill_in 'Username', with: user.username
    # fill_in 'Password', with: "password"
    # click_button 'Log In'
    allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
  end

end
