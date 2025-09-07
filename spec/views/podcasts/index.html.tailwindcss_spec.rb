require 'rails_helper'

RSpec.describe "podcasts/index", type: :view do
  before(:each) do
    assign(:podcasts, [
      Podcast.create!(
        user: nil,
        title: "Title",
        description: "Description"
      ),
      Podcast.create!(
        user: nil,
        title: "Title",
        description: "Description"
      )
    ])
  end

  it "renders a list of podcasts" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
