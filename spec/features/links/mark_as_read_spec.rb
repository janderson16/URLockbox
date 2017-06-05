require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create!(
                       email: "dirk_diggler@boogie.com",
                       password: "password",
                       password_confirmation: "password"
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    link = user.links.create!(url:"https://turing.io", title:"Turing")

    visit "/"

    within(".link-row-#{link.id}") do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within(".link-row-#{link.id}") do
      expect(page).to have_text("true")
    end

  end
end
