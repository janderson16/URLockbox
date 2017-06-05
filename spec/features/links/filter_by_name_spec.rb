require "rails_helper"

RSpec.describe "User can filter links by name", :js => :true do
    context "by entering text in search bar" do
      scenario "starting with one letter" do
      user = User.create!(
                         email: "dirk_diggler@boogie.com",
                         password: "password",
                         password_confirmation: "password"
                         )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      link_1 = user.links.create!(url:"https://www.facebook.com/", title:"Facebook")
      link_2 = user.links.create!(url:"https://github.com", title:"Github")
      link_2 = user.links.create!(url:"https://www.google.com", title:"Google")

      visit "/"

      fill_in "link[filter]", with: "g"

      click_on "Only Unread Links"

      expect(page).to have_content("Github")
      expect(page).to have_content("Google")
      expect(page).to_not have_content("Facebook")
    end
  end
  
  context "by entering text in search bar" do
    scenario "continuing with more letters" do
    user = User.create!(
                       email: "dirk_diggler@boogie.com",
                       password: "password",
                       password_confirmation: "password"
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    link_1 = user.links.create!(url:"https://www.facebook.com/", title:"Facebook")
    link_2 = user.links.create!(url:"https://github.com", title:"Github")
    link_2 = user.links.create!(url:"https://www.google.com", title:"Google")

    visit "/"

    fill_in "link[filter]", with: "gi"

    click_on "Only Unread Links"

    expect(page).to have_content("Github")
    expect(page).to_not have_content("Google")
    expect(page).to_not have_content("Facebook")
    end
  end
end
