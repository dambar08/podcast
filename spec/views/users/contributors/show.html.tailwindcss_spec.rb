require 'rails_helper'

RSpec.describe "users/contributors/show", type: :view do
  before(:each) do
    assign(:contributor, Contributor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
