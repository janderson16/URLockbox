require 'rails_helper'

  describe "User can create an account" do
    context "when they click on create account" do
      scenario "and fill in all necessary fields" do

        visit login_path
        click_on "Sign up"
        expect(current_path).to eq new_user_path

        fill_in "user[email]", with: "johndoe@gmail.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "Create User"

        expect(page).to have_content "Welcome: johndoe@gmail.com"
        expect(page).to have_content "URLockbox"
        expect(current_path).to eq '/'

      end
    end

    context "when they click on create account" do
      scenario "and do NOT fill in password field" do

        visit login_path
        click_on "Sign up"
        expect(current_path).to eq new_user_path

        fill_in "user[email]", with: "johndoe@gmail.com"
        click_on "Create User"

        expect(page).to have_content "Password cannot be blank"
        expect(current_path).to eq new_user_path
      end
    end

    context "when they click on create account" do
      scenario "and do NOT password and confirmation" do

        visit login_path
        click_on "Sign up"
        expect(current_path).to eq new_user_path

        fill_in "user[email]", with: "johndoe@gmail.com"
        fill_in "user[password]", with: "password"
        click_on "Create User"

        expect(page).to have_content "Password and confirmation must match"
        expect(current_path).to eq new_user_path
      end
    end

    context "when they click on create account" do
      scenario "and their email address is already registered" do
        user = User.create(
                           email: "johndoe@gmail.com",
                           password_digest: "password"
                           )
        visit login_path
        click_on "Sign up"
        expect(current_path).to eq new_user_path

        fill_in "user[email]", with: "johndoe@gmail.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "Create User"

        expect(page).to have_content "Email already registered with an account"
        expect(current_path).to eq new_user_path
      end
    end
  end
