class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true
  # property :username, String, unique: true, message: 'Sorry, that username is already taken'
  # property :display_name, String, unique: true, message: 'Sorry, that display name is taken'
  property :password_digest, Text

  # has n, :post

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end