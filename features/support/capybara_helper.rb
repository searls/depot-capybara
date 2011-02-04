module CapybaraHelper
  # A helper class to make accessing web elements via Capybara easier.
  # All methods take an identifier parameter.  This parameter is
  # an array of hashes that are used to identify an element on the
  # page.  On elements that support multiple attributes you can
  # provide multiple identifiers.
  include Capybara 
  
  def self.included(cls)
    cls.extend ClassMethods
  end

  # Tells capybara to wait_until the no more AJAX requests are active.
  # Requires prototype.js. Something similar can be achieved with jQuery
  # just as easily.
  def wait_for_ajax
    wait_until { evaluate_script("Ajax.activeRequestCount == 0") }
  end

  module ClassMethods
    
    # adds three methods - one to put data in a text field, another
    # to fetch that data, and another to return the actual text_field.
    #
    # Example:  text_field(:first_name, 'First Name')
    # will generate the 'first_name', 'first_name=', and
    # 'first_text_field' methods
    def text_field(name, identifier)
      define_method(name) do
        find_field(identifier).value
      end
      define_method("#{name}=") do |value|
        fill_in(identifier, :with=>value)
      end
      define_method("#{name}_text_field") do
        find_field(identifier)
      end
    end

    # adds three methods - one to select an item in a drop-down,
    # another to fetch the currently selected item, and another
    # to return the select_list.
    #
    # Example:  select_list(:state, 'Payment Type')
    # will generate the 'state', 'state=' and 'state_select_list'
    # methods
    def select_list(name, identifier)
      define_method(name) do
        find_field(identifier).value
      end
      define_method("#{name}=") do |value|
        select(value,:from => identifier)
      end
      define_method("#{name}_select_list") do
        find_field(identifier)
      end
    end

    # adds two methods - one to click a button
    #   another to return the button
    #
    # Example:  link(:checkout, '#button')
    # will generate the 'checkout'
    # and 'checkout_button' methods
    def button(name, identifier)
      define_method(name) do        
        button = find_button(identifier)
        wait_until { button.visible? }
        button.click
      end
      define_method("#{name}_button") do
        find_button(identifier)
      end
    end

    # adds two methods - one to click a link and 
    #   another to return the link.
    #
    # Example:  link(:add_to_cart, '#link')
    # will generate the 'add_to_cart'
    # and 'add_to_cart_link' methods
    def link(name, identifier)
      define_method(name) do
        find_link(identifier).click
      end
      define_method("#{name}_link") do
        find_link(identifier)
      end
    end
  
    # adds two methods - one to get the text in a
    #   node (or element) and another to return
    #   the node.
    #
    # Example:  link(:cell, '.total-cell')
    # will generate the 'cell'
    # and 'cell_node' methods  
    def node(name,identifier)
      define_method(name) do
        page.find(identifier).text
      end
      define_method("#{name}_node") do
        page.find(identifier)
      end      
    end
    
    # adds a method to return a an array of    
    #   rows in the identified table, with each
    #   row represented by an array of <td> nodes
    #
    # Example:  rows_in_table(:cart, '.cart')
    # will generate the 'cart' method    
    def rows_in_table(name,identifier)
      define_method(name) do
        table = page.find(identifier)
        table.all('tr').collect { |tr| tr.all('td') }
      end
    end
  end
end
