require 'spec_helper'
require 'post'

feature Post do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the database' do
      expect(Post.count).to eq(0)
      Post.create(title: '1234',
                   text: 'Hello')
      expect(Post.count).to eq(1)
      post = Post.first
      expect(post.text).to eq('Hello')
      post.destroy
      expect(Post.count).to eq(0)
    end

  end

  scenario 'a user has no posts when they first sign up' do
    sign_up
    user = User.first
    expect(user.post_count).to eq(0)
  end

  def sign_up
    visit '/user/new'
    fill_in 'password', with: "1234"
    fill_in 'password_confirmation', with: "1234"
    fill_in 'email', with: "bob@bob.com"
    click_button 'Sign up'
  end


  scenario 'a user can put up a post' do
  end

end
