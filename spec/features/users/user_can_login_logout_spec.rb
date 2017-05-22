require 'rails_helper'

  describe "User can log in and log out of their account" do
    context "with valid credentials" do
      scenario "they click on log in/log out buttons" do
      user = User.create!(
                         email: "johndoe@gmail.com",
                         password: "password",
                         password_confirmation: "password"
                         )

      visit login_path

      fill_in "session[email]", with: "johndoe@gmail.com"
      fill_in "session[password]", with: "password"
      click_on "Login"
      expect(page).to have_content "Welcome: johndoe@gmail.com"

      expect(current_path).to eq('/')

      expect(page).to have_content "Sign out"

      click_on "Sign out"

      expect(current_path).to eq('/login')
      end
    end

    context "with INvalid credentials" do
      scenario "they click on log in button" do
        user = User.create(
                           email: "johndoe@gmail.com",
                           password: "password"
                           )

      visit login_path

      fill_in "session[email]", with: "johndoe@gmail.com"
      fill_in "session[password]", with: "notpassword"
      click_on "Login"

      expect(page).to have_content "Incorrect email and/or password"

      expect(current_path).to eq login_path
      end
    end
  end
