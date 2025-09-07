require 'rails_helper'

RSpec.describe "users/links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(),
      Link.create!()
    ])
  end

  it "renders a list of users/links" do
    render
    cell_selector = 'div>p'
  end
end
