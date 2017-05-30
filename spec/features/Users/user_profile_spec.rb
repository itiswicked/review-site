require 'rails_helper'

feature 'user logs in and is directed their user profile page' do

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user is successfully redirected to user profile page upon log in' do

    sign_in user
    visit user_path(user)

    expect(page).to have_content("Welcome #{user.username}")
  end

  scenario 'user is unsuccessfully redirected to user profile page upon log in' do

    visit user_path(user)

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_current_path(new_user_session_path)
  end
end
