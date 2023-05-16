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
    visit user_posts_path(@id)
    expect(page).to have_content('test comment 1')
  end

  it 'shows how many comments in a post' do
    visit user_posts_path(@id)
    expect(page).to have_content('Comments: 3')
  end

  it 'shows how many likes in a post' do
    visit user_posts_path(@id)
    expect(page).to have_content('Likes: 3')
  end

  it 'shows pagination section' do
    visit user_posts_path(@id)
    expect(find_button('Pagination')).not_to be_nil
  end

  it 'redirects to post page when clicked on a post' do
    post_id = User.first.posts.last.id
    visit user_posts_path(@id)
    click_link('Making the most out of LinkedIn connections')
    sleep 1
    expect(current_path).to eql("/users/#{@id}/posts/#{post_id}")
  end
end
