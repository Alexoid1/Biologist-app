require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'Create a new use with a username already taken' do
    visit('users/new')
    fill_in 'fullname here', with: 'Alexoid Zx'
    fill_in 'user name here', with: 'Alexoid2'
    fill_in 'http://www.imageexmaple.com (size 100x100)', with: 'https://pm1.narvii.com/6742/64b32a15ecbfa9009b5fa4b4717fe1494ea13cbcv2_00.jpg'
    fill_in 'http://www.imageexmaple.com (size 900x350)', with: 'https://cdnb.artstation.com/p/assets/images/images/016/297/965/large/w-u-n-a-k9999-fanart-by-wuna-7.jpg?1551650938'
    click_on 'Create User'
    expect(page).to have_content 'Username has already been taken'
  end
  scenario 'Create a new user' do
    visit('users/new')
    fill_in 'fullname here', with: 'Alexoid Zambrano'
    fill_in 'user name here', with: 'AlexoidZx'
    fill_in 'http://www.imageexmaple.com (size 100x100)', with: 'https://pm1.narvii.com/6742/64b32a15ecbfa9009b5fa4b4717fe1494ea13cbcv2_00.jpg'
    fill_in 'http://www.imageexmaple.com (size 900x350)', with: 'https://cdnb.artstation.com/p/assets/images/images/016/297/965/large/w-u-n-a-k9999-fanart-by-wuna-7.jpg?1551650938'
    click_on 'Create User'
    visit('opinions')
    expect(page).to have_content 'ALEXOID ZAMBRANO'
    expect(page).to have_content 'I am the world! yeahhh'
    expect(page).to have_content 'Alexoid Z'
    expect(page).to have_content 'Jilly M'
  end
end
