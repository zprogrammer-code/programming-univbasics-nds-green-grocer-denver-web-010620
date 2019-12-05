def find_item_by_name_in_collection(name, collection)
 index = 0 
 
 while index < collection.length do
 
  if collection[index][:item] == name
  return collection[index]
end
  index += 1 
 end
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  new_cart = []
  index = 0
  while index < cart.length do 
    new_cart_item = find_item_by_name_in_collection(cart[index][:item],new_cart )
    
    if new_cart_item != nil
      new_cart_item[:count] += 1
    else
      new_cart_item = {
         :item => cart[index][:item], 
         :price => cart[index][:price],
         :clearance => cart[index][:clearance], 
         :count => 1
      }
      new_cart << new_cart_item
    
    end
  index += 1 
  end
  new_cart
end

def apply_coupons(cart, coupons)
  index = 0 
   while index < coupons.length do
     cart_item = find_item_by_name_in_collection(cart[index][:item],coupons[index][:num])
   coupon_item_name = "#{coupons[index][:item]} W/COUPON "
   cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
     
     if cart_item && cart_item[:count] >= coupons[index][:num]
       if cart_item_with_coupon
       
  end
  index += 1
end
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
