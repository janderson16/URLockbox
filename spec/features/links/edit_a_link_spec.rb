require 'rails_helper'

  describe "User tries to edit a link" do
    context "when they are logged in" do
      scenario "and fill in all necessary fields" do
        user = User.create!(
                           email: "dirk_diggler@boogie.com",
                           password: "password",
                           password_confirmation: "password"
                           )
        link = user.links.create!(
                                  title: "Google",
                                  url: "https://www.google.com"
                                  )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/'
        within(".link-row-#{link.id}") do
          click_on "Edit"
        end
        expect(current_path).to eq("/links/#{link.id}/edit")

        fill_in "link[url]", with: "https://github.com"
        fill_in "link[title]", with: "Github"
        click_on "Update Link"

        expect(current_path).to eq("/links")

        within(".link-row-#{link.id}") do
          expect(page).to have_content "Github https://github.com"
        end
      end
    end

    context "when they are logged in" do
      scenario "and they leave the title blank" do
        user = User.create!(
                           email: "dirk_diggler@boogie.com",
                           password: "password",
                           password_confirmation: "password"
                           )
        link = user.links.create!(
                                  title: "Google",
                                  url: "https://www.google.com"
                                  )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/'
        within(".link-row-#{link.id}") do
          click_on "Edit"
        end
        expect(current_path).to eq("/links/#{link.id}/edit")

        fill_in "link[url]", with: "https://github.com"
        fill_in "link[title]", with: ""
        click_on "Update Link"

        expect(page).to have_content "Title cannot be blank"
        expect(current_path).to eq("/links/#{link.id}")
      end
    end

    context "when they are logged in" do
      scenario "and do not put in a valid URL" do
        user = User.create!(
                           email: "dirk_diggler@boogie.com",
                           password: "password",
                           password_confirmation: "password"
                           )
        link = user.links.create!(
                                  title: "Google",
                                  url: "https://www.google.com"
                                  )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/'
        within(".link-row-#{link.id}") do
          click_on "Edit"
        end
        expect(current_path).to eq("/links/#{link.id}/edit")

        fill_in "link[url]", with: "github.com"
        fill_in "link[title]", with: "Github"
        click_on "Update Link"

        expect(page).to have_content "Please check that URL is a valid address"
        expect(current_path).to eq("/links/#{link.id}")
      end
    end
  end
