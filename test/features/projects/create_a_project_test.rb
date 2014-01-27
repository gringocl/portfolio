require "test_helper"

feature "Projects::CreateAProject" do
  scenario "Add a portfolio item" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "CodeFellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"
    page.must_have_content "CodeFellows Portfolio"
    page.wont_have_content "Rails, Ruby, Bootstrap, HTML5, CSS"
  end
end
