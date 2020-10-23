require 'rails_helper'
RSpec.feature 'Followings', type: :feature do
  login

  scenario 'Start following people' do
    visit('/users/56')
    click_on 'Follow'
    visit('/users/57')
    click_on 'Follow'
    visit('/users/54')
    expect(page).to have_content '3'
  end

  scenario 'Check following counter in menu bar' do
    visit('/opinions')
    expect(page).to have_content '1'
  end

  scenario 'Check following counter in user profile' do
    visit('/users/54')
    expect(page).to have_content '1'
  end

  scenario 'Check list of followers in followed user profile' do
    visit('/users/55')
    expect(page).to have_content 'Alexoid Z'
  end
end
