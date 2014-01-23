require "test_helper"

feature "Deleting a Post" do
  scenario "A post is deleted with a click" do
    visit posts_path

    page.find("a[data-confirm][href='#{post_path(posts(:two))}']").click
    page.wont_have_content posts(:two).body
  end
end
