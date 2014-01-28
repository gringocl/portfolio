require "test_helper"

feature "Delete unwanted projects" do
  scenario "delete a project form the database" do
    visit projects_path
    click_on projects(:portfolio).name
    click_on "Delete Project"
    current_path.must_match projects_path
    page.wont_have_content projects(:portfolio).name
  end
end
