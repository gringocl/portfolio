require "test_helper"

feature "CanViewWelcomIndex" do
  scenario "View Welcome Page" do
    visit root_path
    page.must_have_content "Miles"
  end
end
