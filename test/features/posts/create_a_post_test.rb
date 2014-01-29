require "test_helper"

feature "CreateAPost" do
  scenario "Submit form data to create a new post" do
    visit new_user_session_path
    fill_in "Email", with: users(:matias).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    visit new_post_path
    fill_in('Title', with: 'Becoming a CodeFellow')
    fill_in('Body', with: 'Means striving for excellence')
    click_link_or_button 'Create Post'
    page.must_have_content 'success'
    page.must_have_content 'Becoming a CodeFellow'
    page.has_css? "#author"
    page.must_have_content users(:matias).email
  end
end
