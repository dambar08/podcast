require 'rails_helper'

RSpec.describe "users/links/edit", type: :view do
  let(:link) {
    Link.create!()
  }

  before(:each) do
    assign(:link, link)
  end

  it "renders the edit users_link form" do
    render

    assert_select "form[action=?][method=?]", users_link_path(link), "post" do
    end
  end
end
