require 'rails_helper'

RSpec.describe 'users/[:id]', type: :system do
  before :all do
    @id = User.first.id
  end

  it "shows user's profile picture" do
    visit user_path(@id)
    expect(page.all('img').length).to eql 1
  end

  it "shows user's name" do
    visit user_path(@id)
    expect(page).to have_content('Ram Kumar')
  end

  it "shows user's post count" do
    visit user_path(@id)
    expect(page).to have_content('Number of posts: 4')
  end

  it "shows user's bio" do
    visit user_path(@id)
    expect(page).to have_content(
      'I am full stack web developer. Interested in Rails as backend and React as frontend'
    )
  end

  it "shows user's first three posts" do
    visit user_path(@id)
    posts = page.all('.post-tile')
    expect(posts.length).to eql 3
  end

  it "shows a 'See all posts' button" do
    visit user_path(@id)
    expect(body).to have_selector 'button', text: 'See all posts'
  end

  it 'clicking on post redirects to post show page' do
    visit user_path(@id)
    post_id = User.first.last_three_posts.first.id
    click_link('Making the most ')
    sleep 2
    expect(current_path).to eql("/users/#{@id}/posts/#{post_id}")
  end

  it 'clicking see all posts redirects to posts index page' do
    visit user_path(@id)
    sleep 2
    find('.btn-all-posts').click
    sleep 2
    expect(current_path).to eql("/users/#{@id}/posts")
  end
end
