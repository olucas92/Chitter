require 'spec_helper'

feature "User adds a new post" do

  scenario "when browsing the homepage" do
    expect(Post.count).to eq(0)
    visit '/'
    add_post("Example", "Test")
    expect(Post.count).to eq(1)
    post = Post.first
    expect(post.title).to eq("Example")
    expect(post.text).to eq("Test")
  end

  def add_post(title, text)
    within('#new-post') do
      fill_in 'title', :with => title
      fill_in 'text', :with => text
      click_button 'Add post'
    end
  end
end