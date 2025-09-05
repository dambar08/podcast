require 'rails_helper'

RSpec.describe "users/episodes/index", type: :view do
  before(:each) do
    assign(:episodes, [
      Episode.create!(),
      Episode.create!()
    ])
  end

  it "renders a list of users/episodes" do
    render
    cell_selector = 'div>p'
  end
end
