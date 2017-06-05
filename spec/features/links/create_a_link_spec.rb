require 'rails_helper'

describe "User tries to create a link", :js => :true  do
  context "when they are logged in" do
    scenario "and fill in all necessary fields" do
      user = User.create!(
                         email: "dirk_diggler@boogie.com",
                         password: "password",
                         password_confirmation: "password"
                         )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      fill_in "link[url]", with: "https://github.com/"
      fill_in "link[title]", with: "GitHub"
      click_on "Create Link"

      wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
      alert = wait.until { page.driver.browser.switch_to.alert }
      alert.accept

      expect(page).to have_content "GitHub"
      expect(page).to have_content "https://github.com/"
      expect(page).to have_content "false"
    end
  end

  context "when they are logged in" do
    scenario "and do not fill in title" do
      user = User.create!(
                         email: "dirk_diggler@boogie.com",
                         password: "password",
                         password_confirmation: "password"
                         )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      fill_in "link[url]", with: "https://www.google.com"
      click_on "Create Link"

      wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
      alert = wait.until { page.driver.browser.switch_to.alert }
      alert.accept

      expect(page).to_not have_content "Google"
      expect(page).to_not have_content "https://www.google.com"
    end
  end

  context "when they are logged in" do
    scenario "and do not fill in a correct URL" do
      user = User.create!(
                         email: "dirk_diggler@boogie.com",
                         password: "password",
                         password_confirmation: "password"
                         )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      fill_in "link[url]", with: "google.com"
      fill_in "link[title]", with: "Google"
      click_on "Create Link"

      wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
      alert = wait.until { page.driver.browser.switch_to.alert }
      alert.accept

      expect(page).to_not have_content "Google"
      expect(page).to_not have_content "https://www.google.com"
    end
  end
end
