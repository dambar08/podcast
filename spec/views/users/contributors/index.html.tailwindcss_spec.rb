require 'rails_helper'

RSpec.describe "users/contributors/index", type: :view do
  before(:each) do
    assign(:contributors, [
      Contributor.create!(),
      Contributor.create!()
    ])
  end

  it "renders a list of users/contributors" do
    render
    cell_selector = 'div>p'
  end
end
