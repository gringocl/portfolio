require "test_helper"

feature "As a user be able to log in a log out" do
  scenario "log in and create a session" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: users(:matias).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    page.must_have_content "Signed in successfully."
    page.wont_have_content "error"
  end

  scenario "log out and destroy a session" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: users(:matias).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    page.must_have_content "Signed in successfully."
    click_on "Sign Out"
    page.must_have_content "success"
  end
end
