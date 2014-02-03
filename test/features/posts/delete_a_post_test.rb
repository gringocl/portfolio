require "test_helper"

feature "Deleting a Post" do
  scenario "A post is deleted with a click" do
    skip("Don't Want Delete on my production end")
    visit posts_path

    page.find("a[data-confirm][href='#{post_path(posts(:two))}']").click
    page.wont_have_content posts(:two).body
  end
end
