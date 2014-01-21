require "test_helper"

feature "ThemeLoads" do
  scenario "See that theme works" do
    visit root_path
    save_and_open_page
    page.must_have_content "gringo.io"
    page.must_have_css ".large-10"
  end
end
