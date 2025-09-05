require 'rails_helper'

RSpec.describe "users/contributors/edit", type: :view do
  let(:contributor) {
    Contributor.create!()
  }

  before(:each) do
    assign(:contributor, contributor)
  end

  it "renders the edit users_contributor form" do
    render

    assert_select "form[action=?][method=?]", users_contributor_path(contributor), "post" do
    end
  end
end
