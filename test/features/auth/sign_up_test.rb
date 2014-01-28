require "test_helper"

feature "As a user I want to be able to sign up for an account" do
  scenario "sign up" do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "condorito@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: 'password1'
    click_on "Sign up"
    page.must_have_content "Welcome"
    page.wont_have_content "errors"
  end
end
