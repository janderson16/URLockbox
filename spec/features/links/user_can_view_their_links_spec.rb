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

        within(".link-#{link_1.id}") do
          expect(page).to have_content "Title: Google"
          expect(page).to have_content "URL: https://www.google.com"
          expect(page).to have_content "Read? false"
        end

        within(".link-#{link_2.id}") do
          expect(page).to have_content "Title: Github"
          expect(page).to have_content "URL: https://github.com"
          expect(page).to have_content "Read? false"
        end
      end
    end
  end
