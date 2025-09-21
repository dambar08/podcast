require 'rails_helper'

RSpec.describe "podcasts/new", type: :view do
  before(:each) do
    assign(:podcast, Podcast.new(
      user: nil,
      title: "MyString",
      description: "MyString"
    ))
  end

  it "renders new podcast form" do
    render

    assert_select "form[action=?][method=?]", podcasts_path, "post" do
      assert_select "input[name=?]", "podcast[user_id]"

      assert_select "input[name=?]", "podcast[title]"

      assert_select "input[name=?]", "podcast[description]"
    end
  end
end
