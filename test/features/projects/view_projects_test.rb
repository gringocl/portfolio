require "test_helper"

feature "Be able to view individual projects" do
  scenario "View all projects" do
    visit projects_path
    page.must_have_content projects(:portfolio).name
    page.must_have_content projects(:freelance).name
  end

  scenario "View individual projects" do
    visit projects_path
    click_on projects(:portfolio).name
    page.must_have_content projects(:portfolio).technologies_used
  end
end
