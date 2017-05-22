require 'rails_helper'

  describe "User tries to create a link" do
    context "when they are logged in" do
      scenario "and fill in all necessary fields" do
        user = User.create!(
                           email: "dirk_diggler@boogie.com",
                           password: "password",
                           password_confirmation: "password"
                           )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/'

        fill_in "link[url]", with: "https://www.google.com"
        fill_in "link[title]", with: "Google"
        click_on "Create Link"

        within(".link-1") do
          expect(page).to have_content "Google"
          expect(page).to have_content "https://www.google.com"
          expect(page).to have_content "false"
        end
      end
    end
  end
