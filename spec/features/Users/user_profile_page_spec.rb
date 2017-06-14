require 'rails_helper'

feature 'user interacts with profile page' do

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'user clicks edit page' do

    sign_in user
    visit user_path(user)

    click_link 'Edit/Update your account information'

    expect(page).to have_current_path(edit_user_registration_path)
  end

  scenario 'user clicks a listed item' do
    item = FactoryGirl.create(:item, user_id: user.id)

    sign_in user
    visit user_path(user)
    click_link item.name


    expect(page).to have_current_path(user_item_path)
  end
end
