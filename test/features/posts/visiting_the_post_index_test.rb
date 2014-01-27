require "test_helper"

feature "visiting The Post Index" do
  scenario "with existing posts show list" do
    Post.create(title:"Becoming a Web Developer", body: "Means striving for excellence")
    visit posts_path
    page.must_have_content "Becoming"
  end
end
