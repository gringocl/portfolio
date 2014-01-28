require "test_helper"

feature "Have the ability to Edit a project to correct typos" do
  scenario "edit and existing project" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "My Rad Portfolio"
    click_on "Update Project"
    page.must_have_content "Project was successfully updated!"
    page.must_have_content "My Rad Portfolio"
    page.wont_have_content "Codefellow Portfolio"
  end

  scenario "Ensure updated information is valid" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Err"
    click_on "Update Project"
    page.must_have_content "prohibited"
    page.must_have_content "Name is too short"
    page.must_have_content "Project could not be updated."
  end
end
