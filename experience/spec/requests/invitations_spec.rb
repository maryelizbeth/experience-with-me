require 'spec_helper'

describe "Invitations" do
  describe "GET /invitations/new" do
    it "allows a user to create an invitation" do
      visit new_invitation_path
      page.should have_content("Invite a Friend")
    end
  end
end
