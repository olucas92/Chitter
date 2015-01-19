require 'spec_helper'

feature "User browses the list of posts" do

  before(:each) {
    Post.create(:id => "Example",
                :text => "Test")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Test")
  end

end
