require "test_helper"

feature "Deleting a Post" do
  scenario "A post is deleted with a click" do
    post = Posts.create(title:"First", body:"This is my post")
    visit posts_path
    click_link_or_button "Delete"

    page.wont_have_content "This is my post"
    page.must_have_content "Success"
  end
end
