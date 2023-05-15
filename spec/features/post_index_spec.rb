require 'rails_helper'

RSpec.describe 'users/[:id]/posts/', type: :system do
  before :all do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    require_relative '../test_data.rb'
    @id = User.first.id
  end
  it "shows user's profile picture" do
    visit user_posts_path(@id)
    expect(page.all('img').length).to eql 1
  end

  it "shows user's name" do
    visit user_posts_path(@id)
    expect(page).to have_content('Ram Kumar')
  end

  it "shows user's post count" do
    visit user_posts_path(@id)
    expect(page).to have_content('Number of posts: 4')
  end

  it 'shows post title' do
    visit user_posts_path(@id)
    expect(page).to have_content('Making the most out of LinkedIn connections')
  end

  it 'shows some of posts body' do
    visit user_posts_path(@id)
    expect(page).to have_content(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
    )
  end

  it 'shows first comment on a post' do
  end

  it 'shows how many comments in a post' do
    visit user_posts_path(@id)
    expect(page).to have_content('Comments: 2')
  end

  it 'shows how many likes in a post' do
    visit user_posts_path(@id)
    expect(page).to have_content('Likes: 3')
  end
end
