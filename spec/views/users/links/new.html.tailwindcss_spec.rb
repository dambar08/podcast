require 'rails_helper'

RSpec.describe "users/links/new", type: :view do
  before(:each) do
    assign(:link, Link.new())
  end

  it "renders new users_link form" do
    render

    assert_select "form[action=?][method=?]", users_links_path, "post" do
    end
  end
end
