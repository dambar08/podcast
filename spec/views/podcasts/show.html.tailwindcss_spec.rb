require 'rails_helper'

RSpec.describe "podcasts/show", type: :view do
  before(:each) do
    assign(:podcast, Podcast.create!(
      user: nil,
      title: "Title",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end
