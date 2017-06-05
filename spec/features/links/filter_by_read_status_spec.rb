require "rails_helper"

RSpec.describe "User can filter links that have been read", :js => :true do
  scenario "by clicking 'Only Unread Links' button" do
    user = User.create!(
                       email: "dirk_diggler@boogie.com",
                       password: "password",
                       password_confirmation: "password"
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    link_1 = user.links.create!(url:"https://turing.io", title:"Turing")
    link_2 = user.links.create!(url:"https://github.com", title:"Github", read:"true")

    visit "/"

    click_on "Only Unread Links"

    expect(page).to have_content("Turing")
    expect(page).to_not have_content("Github")
  end

  scenario "by clicking 'Only Read Links' button" do
    user = User.create!(
                       email: "dirk_diggler@boogie.com",
                       password: "password",
                       password_confirmation: "password"
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    link_1 = user.links.create!(url:"https://turing.io", title:"Turing")
    link_2 = user.links.create!(url:"https://github.com", title:"Github", read:"true")

    visit "/"

    click_on "Only Read Links"

    expect(page).to_not have_content("Turing")
    expect(page).to have_content("Github")
  end
end
