class ShoppingCartPage
  include Capybara
  include CapybaraHelper  

  QUANTITY_COLUMN = 1
  DESCRIPTION_COLUMN = 2
  EACH_COLUMN = 3
  TOTAL_COLUMN = 4
  HEADER_OFFSET = 2

  button(:checkout, 'Checkout')
  def continue_shopping 
    #apparently my version of depot doesn't have this button?
  end 
  cell(:cart_total, '.total-cell')
  table(:shopping_cart, :index => 1)

  def goto_checkout_page
    checkout
    CheckoutPage.new
  end
  
  def quantity_for_line(line_number)
    cart_data_for_line(line_number)[QUANTITY_COLUMN].text
  end

  def description_for_line(line_number)
    cart_data_for_line(line_number)[DESCRIPTION_COLUMN].text
  end
  
  def each_for_line(line_number)
    cart_data_for_line(line_number)[EACH_COLUMN].text
  end

  def total_for_line(line_number)
    cart_data_for_line(line_number)[TOTAL_COLUMN].text
  end

  private

  def cart_data_for_line(line)
    shopping_cart[HEADER_OFFSET+line]
  end
  
end
