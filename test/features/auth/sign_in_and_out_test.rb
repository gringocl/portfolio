require "test_helper"

feature "As a user be able to log in a log out" do
  scenario "log in and create a session" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: users(:matias).email
    fill_in "Password", with: users(:matias).password
    fill_in "Password Confirmation", with: users(:matias).password
    page.must_have_content "Welcome"
    page.wont_have_content "problem"
  end
end
