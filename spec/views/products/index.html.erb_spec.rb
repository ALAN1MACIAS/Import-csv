require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        description: "Description",
        price: 2,
        total: 3
      ),
      Product.create!(
        description: "Description",
        price: 2,
        total: 3
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
