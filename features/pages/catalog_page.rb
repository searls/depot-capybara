class CatalogPage
  include Capybara
  include CapybaraHelper
  
  BOOK_MAPPING = {
  "Pragmatic Project Automation" => 1,
  "Pragmatic Unit Testing (C#)" => 2,
  "Pragmatic Version Control" => 3
  }
  
  def visit
    Capybara.visit('store')
  end

  def add_book_to_shopping_cart(name="Pragmatic Project Automation")
    all("input[value='Add to Cart']")[BOOK_MAPPING[name]-1].click
    wait_for_ajax
    ShoppingCartPage.new
  end
end
