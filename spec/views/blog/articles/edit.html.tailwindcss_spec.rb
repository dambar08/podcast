require 'rails_helper'

RSpec.describe "blog/articles/edit", type: :view do
  let(:article) {
    Article.create!()
  }

  before(:each) do
    assign(:article, article)
  end

  it "renders the edit blog_article form" do
    render

    assert_select "form[action=?][method=?]", blog_article_path(article), "post" do
    end
  end
end
