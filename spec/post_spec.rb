require 'spec_helper'

describe Post do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the database' do
      expect(Post.count).to eq(0)
      Post.create(id: '1234',
                   text: 'Hello')
      expect(Post.count).to eq(1)
      post = Post.first
      expect(post.id).to eq(1234)
      expect(post.text).to eq('Hello')
      post.destroy
      expect(Post.count).to eq(0)
    end

  end

end