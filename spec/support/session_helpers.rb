module SessionHelpers

  def login(user = nil)
    user = user ||= create(:user)
    # puts user.inspect
    visit login_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit user_path(user)
    expect(page).to have_css('h1', text: "#{user.username.upcase}'S PROFILE" )
  end


end
