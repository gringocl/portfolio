require "test_helper"

feature "ThemeLoads" do
  scenario "See that theme works" do
    visit root_path
    page.must_have_content "gringo.io"
    page.must_have_css ".large-10"
  end
end
