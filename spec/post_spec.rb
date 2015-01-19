require 'spec_helper'
require 'post'

describe Post do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the database' do
      expect(Post.count).to eq(0)
      Post.create(title: '1234',
                   text: 'Hello')
      expect(Post.count).to eq(1)
      post = Post.first
      expect(post.id).to eq(1234)
      expect(post.text).to eq('Hello')
      post.destroy
      expect(Post.count).to eq(0)
    end

  end

  scenario 'a user has no posts when they first sign up' do
    sign_up
    user = User.first
    expect(user.Post.count).to eq(0)
    expect(user.Post.length).to eq(0)
  end

  scenario 'a user can put up a post' do
  end

end
