require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
end

# spec/views/products/_product.html.erb_spec.rb

describe 'products/_product.html.erb' do
  context 'when the product has a url' do
    it 'displays the url' do
      assign(:product, build(:product, url: 'http://example.com')

      render

      expect(rendered).to have_link 'Product', href: 'http://example.com'
    end
  end

  context 'when the product url is nil' do
    it "displays 'None'" do
      assign(:product, build(:product, url: nil)

      render

      expect(rendered).to have_content 'None'
    end
  end
end
