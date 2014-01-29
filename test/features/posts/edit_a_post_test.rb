require "test_helper"

feature "Edit a post" do
  scenario "Edit a post" do
    visit new_user_session_path
    fill_in "Email", with: users(:matias).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    save_and_open_page

    visit post_path(posts(:one))
    click_link_or_button "Edit"

    fill_in "Body", with: "Oops I made a mistake"
    click_link_or_button "Update Post"

    page.must_have_content "success"
    page.must_have_content "Oops I made"
  end
end
