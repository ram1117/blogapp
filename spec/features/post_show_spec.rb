require 'rails_helper'

RSpec.describe 'users/[:id]/posts/[:id]', type: :system do
  before :all do
    @id = User.first.id
    @post_id = User.first.posts.first.id
  end

  it 'shows post title' do
    visit user_post_path(@id, @post_id)
    expect(page).to have_content('My experience learning Rails')
  end

  it 'shows post author' do
    visit user_post_path(@id, @post_id)
    expect(page).to have_content('Author: Ram Kumar')
  end

  it 'shows comments count' do
    visit user_post_path(@id, @post_id)
    expect(page).to have_content('Comments: 2')
  end

  it 'shows likes count' do
    visit user_post_path(@id, @post_id)
    expect(page).to have_content('Likes: 0')
  end

  it 'shows post body' do
    visit user_post_path(@id, @post_id)
    expect(page).to have_content(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    )
  end

  it "shows a comment's author" do
    visit user_post_path(@id, @post_id)
    expect(page).to have_content('Lilly')
  end

  it 'shows comments from each user' do
    visit user_post_path(@id, @post_id)
    container = find('.comments-container')
    expect(container).to have_css('p', count: 2)
  end
end
