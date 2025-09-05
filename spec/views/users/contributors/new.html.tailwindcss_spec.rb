require 'rails_helper'

RSpec.describe "users/contributors/new", type: :view do
  before(:each) do
    assign(:contributor, Contributor.new())
  end

  it "renders new users_contributor form" do
    render

    assert_select "form[action=?][method=?]", users_contributors_path, "post" do
    end
  end
end
