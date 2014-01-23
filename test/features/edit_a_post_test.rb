require "test_helper"

feature "Edit a post" do
  scenario "Edit a post" do
    visit post_path(posts(:one))
    click_link_or_button "Edit"

    fill_in "Body", with: "Oops I made a mistake"
    click_link_or_button "Update Post"

    page.must_have_content "success"
    page.must_have_content "Oops I made"
  end
end
