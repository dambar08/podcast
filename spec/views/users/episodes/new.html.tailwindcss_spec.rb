require 'rails_helper'

RSpec.describe "users/episodes/new", type: :view do
  before(:each) do
    assign(:episode, Episode.new())
  end

  it "renders new users_episode form" do
    render

    assert_select "form[action=?][method=?]", users_episodes_path, "post" do
    end
  end
end
