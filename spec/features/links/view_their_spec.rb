require 'rails_helper'

  describe "User can see their links" do
    context "when they are logged in" do
      scenario "and go to the root" do
        user = User.create!(
                           email: "dirk_diggler@boogie.com",
                           password: "password",
                           password_confirmation: "password"
                           )
        link_1 = user.links.create!(
                                 title: "Google",
                                 url: "https://www.google.com"
                                 )
        link_2 = user.links.create!(
                                 title: "Github",
                                 url: "https://github.com"
                                 )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/'

        within(".link-row-#{link_1.id}") do
          expect(page).to have_content "Google"
          expect(page).to have_content "https://www.google.com"
          expect(page).to have_content "false"
        end

        within(".link-row-#{link_2.id}") do
          expect(page).to have_content "Github"
          expect(page).to have_content "https://github.com"
          expect(page).to have_content "false"
        end
      end
    end
  end
