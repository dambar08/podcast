require 'rails_helper'

RSpec.describe "blog/articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new())
  end

  it "renders new blog_article form" do
    render

    assert_select "form[action=?][method=?]", blog_articles_path, "post" do
    end
  end
end
