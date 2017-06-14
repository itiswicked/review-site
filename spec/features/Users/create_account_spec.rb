require 'rails_helper'

feature 'user creates new account' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:new_user) {
    User.new(
      username: "Ceeplusplus",
      email: "javaismycopilot@gmail.com",
      password: "Changeme"
    )
  }

    scenario 'unauthenticated user visits homepage' do
      visit new_user_session_path

      expect(page).to have_content("Log in Email")
    end

    scenario 'user successfully creates account' do
      visit new_user_session_path

      click_button 'Sign up'

      fill_in 'Username', with: new_user.username
      fill_in 'Email', with: new_user.email
      fill_in 'Password', with: new_user.password
      fill_in 'Password confirmation', with: new_user.password

      click_button 'Sign up'

      expect(page).to have_content("Welcome! You have signed up successfully.")
    end

    scenario 'user unsuccessfully creates account' do
      visit new_user_session_path

      click_button 'Sign up'

      fill_in 'Username', with: new_user.username
      fill_in 'Email', with: new_user.email

      click_button 'Sign up'

      expect(page).to have_content("Password can't be blank")
    end

    scenario 'user successfully logs into their account' do
      visit new_user_session_path

      sign_in user
      visit root_path

      expect(page).to have_content("#{user.username}")
    end

    scenario 'user successfully logs out of their account' do
      visit new_user_session_path

      sign_in user
      visit root_path
      sign_out user
      visit root_path

      expect(page).to have_content("Log in Email")
    end
end
