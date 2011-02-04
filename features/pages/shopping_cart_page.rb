class ShoppingCartPage
  include Capybara
  include CapybaraHelper  

  QUANTITY_COLUMN = 0
  DESCRIPTION_COLUMN = 1
  # EACH_COLUMN = 2
  TOTAL_COLUMN = 2

  button(:checkout, 'Checkout')
  def continue_shopping 
    #apparently my version of depot doesn't have this button?
  end 
  node(:cart_total, '.total-cell')
  rows_in_table(:shopping_cart, 'table')

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
  
  # def each_for_line(line_number)
  #   cart_data_for_line(line_number)[EACH_COLUMN].text
  # end

  def total_for_line(line_number)
    cart_data_for_line(line_number)[TOTAL_COLUMN].text
  end

  private

  def cart_data_for_line(line)
    shopping_cart[line-1]
  end
  
end
