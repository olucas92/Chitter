class Post

  include DataMapper::Resource

  property :title, Serial
  property :text, String

end