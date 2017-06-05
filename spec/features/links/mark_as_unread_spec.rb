require "rails_helper"

describe "can mark links as unread", :js => :true do
  scenario "Mark a link as read" do
    user = User.create!(
                       email: "dirk_diggler@boogie.com",
                       password: "password",
                       password_confirmation: "password"
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    link = user.links.create!(url:"https://turing.io", title:"Turing", read:"true")

    visit "/"

    within(".link-row-#{link.id}") do
      expect(page).to have_text("true")
    end

    click_on "Mark as Unread"

    within(".link-row-#{link.id}") do
      expect(page).to have_text("false")
    end

  end
end
