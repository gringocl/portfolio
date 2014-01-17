require "test_helper"

feature "CanViewWelcomIndex" do
  scenario "View Welcome Page" do
    visit "http://localhost:3000"
    page.must_have_content "Welcome"
  end
end
