require 'rails_helper'

RSpec.describe "podcasts/edit", type: :view do
  let(:podcast) {
    Podcast.create!(
      user: nil,
      title: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:podcast, podcast)
  end

  it "renders the edit podcast form" do
    render

    assert_select "form[action=?][method=?]", podcast_path(podcast), "post" do
      assert_select "input[name=?]", "podcast[user_id]"

      assert_select "input[name=?]", "podcast[title]"

      assert_select "input[name=?]", "podcast[description]"
    end
  end
end
