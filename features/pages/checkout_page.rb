class CheckoutPage
  include CapybaraHelper

  DEFAULT_DATA = {
    'name' => 'Cheezy',
    'address' => '123 Main Street',
    'email' => 'cheezy@example.com',
    'pay_type' => 'Check'
  }

  text_field(:name, 'Name')
  text_field(:address, 'Address')
  text_field(:email, 'E-mail')
  select_list(:pay_type, 'Pay with')
  button(:place_order, 'Place Order')
  
  def complete_order(data={})
    data = DEFAULT_DATA.merge(data)
    self.name = data['name']
    self.address = data['address']
    self.email = data['email']
    self.pay_type = data['pay_type']
    place_order
  end
end
