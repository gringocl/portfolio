require "test_helper"

feature "CreateAPost" do
  scenario "Submit form data to create a new post" do
    sign_in(:author)
    visit new_post_path
    fill_in('Title', with: 'Becoming a CodeFellow')
    fill_in('Body', with: 'Means striving for excellence')
    page.find("[type='submit']").click
    page.must_have_content 'success'
    
    page.must_have_content 'Becoming a CodeFellow'
    page.has_css? "#author"
    page.text.must_include "Status: Unpublished"
    page.must_have_content users(:author).email
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new post button" do
    visit posts_path
    page.wont_have_link "New Post"
    end

  scenario "authors can't publish" do
    sign_in(:author)
    visit new_post_path
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_post_path
    page.must_have_field('Published')

    fill_in "Title", with: posts(:one).title
    fill_in "Body", with: posts(:one).body
    check "Published"
    click_on "Create Post"

    page.text.must_include "Status: Published"
  end

end
