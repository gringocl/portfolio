require "test_helper"

feature "CreateAPost" do
  scenario "Submit form data to create a new post" do
    visit new_post_path
    fill_in('Title', with: 'Becoming a CodeFellow')
    fill_in('Body', with: 'Means striving for excellence')
    click_link_or_button 'Create Post'
    page.must_have_content 'success'
    page.must_have_content 'Becoming a CodeFellow'
  end
end
