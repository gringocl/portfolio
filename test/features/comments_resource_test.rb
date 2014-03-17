require "test_helper"

feature "I want to troll blog authors" do
  scenario "Create comment as site visitor", js: true do
    visit post_path(posts(:one))
    page.wont_have_link "Add Comment"
  end

  scenario "Allow authors to approve comments" do
    sign_in(:author)
    visit post_path(posts(:one))
    click_on "Approve!"
    page.wont_have_content "Approve!"
  end

  scenario "Allow editors to approve comments" do
    sign_in(:editor)
    visit post_path(posts(:one))
    click_on "Approve!"
    page.wont_have_content "Approve!"
  end

  scenario "Allow editors to delete comments" do
    sign_in(:editor)
    visit post_path(posts(:one))
    page.find("a[data-confirm][href='#{post_comment_path posts(:one), comments(:approved)}']").click
    page.wont_have_content comments(:approved).content
  end
end

feature "I want to comment on projects" do
  scenario "Create comment in a project", js: true do
    sign_in(:matias)
    visit project_path(projects(:portfolio))
    click_on "Add Comment"
    fill_in 'Comment', with: 'Cool post but you still suck as a writer'
    page.find("[type='submit']").click
    page.must_have_content 'Cool post but you still suck as a writer'
  end
after { page.driver.reset! }
end
