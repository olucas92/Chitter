require 'spec_helper'

feature 'User signs up' do

  scenario 'when a new user visits the site' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcom, bob@bob.com")
    expect(User.first.email).to eq("bob@bob.com")
  end

end