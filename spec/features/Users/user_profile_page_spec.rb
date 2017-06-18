require 'rails_helper'

feature 'user interacts with profile page' do

  let!(:user) { FactoryGirl.create(:user, avatar: 'http://2.bp.blogspot.com/-zNpb4Jn9Ty8/U0r4QBWGMUI/AAAAAAAAMac/3ELb2P-SX8U/s1600/afrika+bambaataa+planet+rock.jpg') }

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


    expect(page).to have_current_path(user_item_path(item, user))
  end

  scenario 'user clicks to view all their posted items' do
    item = FactoryGirl.create(:item, user_id: user.id)

    sign_in user
    visit user_path(user)
    click_link 'See all of your items'

    expect(page).to have_current_path(user_items_path(user))
  end

  scenario 'user clicks a listed review' do
    item = FactoryGirl.create(:item, user_id: user.id)
    review = FactoryGirl.create(:review, user_id: user.id, item_id: item.id)

    sign_in user
    visit user_path(user)

    click_link item.name

    expect(page).to have_current_path(item_path(review.item))
  end
end
