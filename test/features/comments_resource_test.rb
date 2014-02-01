require "test_helper"

feature "I want to troll blog authors" do
  scenario "Create comment as site visitor" do
    visit post_path(posts(:one))
    fill_in('Comment', with: 'Cool post but you still suck as a writer')
    page.find("[type='submit']").click
    page.must_have_content 'Cool post but you still suck as a writer'
  end

  scenario "Allow authors to approve comments" do
    sign_in(:author)
    visit post_path(posts(:one))
    click_on "Approve!"
    page.must_have_content(comments(:unapproved).content)
  end

  scenario "Allow editors to approve comments" do
    sign_in(:editor)
    visit post_path(posts(:one))
    click_on "Approve!"
    page.must_have_content(comments(:unapproved).content)
  end

  scenario "Allow editors to delete comments" do
    sign_in(:editor)
    visit post_path(posts(:one))
    page.find("a[data-confirm][href='#{comment_path(comments(:approved))}']").click
    page.wont_have_content comments(:approved).content
  end
end
