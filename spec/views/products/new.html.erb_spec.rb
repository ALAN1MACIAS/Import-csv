require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      description: "MyString",
      price: 1,
      total: 1
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[total]"
    end
  end
end
