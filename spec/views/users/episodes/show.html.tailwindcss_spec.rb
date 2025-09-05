require 'rails_helper'

RSpec.describe "users/episodes/show", type: :view do
  before(:each) do
    assign(:episode, Episode.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
