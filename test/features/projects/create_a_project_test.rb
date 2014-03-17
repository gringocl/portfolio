require "test_helper"

feature "Projects::CreateAProject" do
  scenario "Add a portfolio item" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "CodeFellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"
    click_on "Create Project"
    page.must_have_content "Rails, Ruby, Bootstrap, HTML5, CSS3"
    page.must_have_content "CodeFellows Portfolio"
    page.must_have_content "success"
  end

  scenario "Ensure that Project information is valid" do
    visit new_project_path
    fill_in "Name", with: "Q"
    fill_in "Technologies used", with: ""
    click_on "Create Project"
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
