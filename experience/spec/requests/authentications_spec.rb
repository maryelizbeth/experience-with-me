require 'spec_helper'


describe "GET /o/oauth2/auth" do
  before do 
    visit root_path 
    click_link "sign in with google"
  end 
  it "directs the user to google auth page" do
    page.should have_content("access your Google Account.")
  end
end
