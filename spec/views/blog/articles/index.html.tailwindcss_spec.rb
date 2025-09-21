require 'rails_helper'

RSpec.describe "blog/articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(),
      Article.create!()
    ])
  end

  it "renders a list of blog/articles" do
    render
    cell_selector = 'div>p'
  end
end
