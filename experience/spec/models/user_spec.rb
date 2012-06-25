require 'spec_helper'

describe User do
  context "Signing Up with GMail" do 
    
    describe "GET /auth/google" do
      it "directs the user to google" do 
        page.should have_content("A third party service is requesting permission to access your Google Account.")
      end 
    end 
  end
end
