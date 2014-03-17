require "test_helper"

feature "visiting The Post Index" do
  scenario "with existing posts show list" do
    visit posts_path
    page.must_have_content posts(:one).body
  end
end
