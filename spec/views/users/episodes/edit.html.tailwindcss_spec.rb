require 'rails_helper'

RSpec.describe "users/episodes/edit", type: :view do
  let(:episode) {
    Episode.create!()
  }

  before(:each) do
    assign(:episode, episode)
  end

  it "renders the edit users_episode form" do
    render

    assert_select "form[action=?][method=?]", users_episode_path(episode), "post" do
    end
  end
end
