require 'rails_helper'
RSpec.describe '/users/', type: :system do
  before :all do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    require_relative '../test_data.rb'
  end

  it 'has other users' do
    visit users_path
    expect(page).to have_content('Ram Kumar')
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Michael')
  end
  it 'has profile picture for each user' do
    visit users_path
    expect(page.all('img').length).to eql 3
  end

  it 'has number of posts counter for each user' do
    visit users_path
    expect(page).to have_content('Number of posts:', count: 3)
  end

  it 'click on user redirect to show user page' do
    visit users_path
    click_link('Ram Kumar')
    id = User.first.id
    sleep 2
    expect(current_path).to eql("/users/#{id}")
  end
end
