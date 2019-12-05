def find_item_by_name_in_collection(name, collection)
 index = 0 
 
 while index < collection.length do
 
  if collection[index][:item] == name
  return collection[index]
end
  index += 1 
 end

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
 return new_cart
end

def apply_coupons(cart, coupons)
  index = 0 
   while index < coupons.length do
     cart_item = find_item_by_name_in_collection(coupons[index][:item],cart)
   coupon_item_name = "#{coupons[index][:item]} W/COUPON"
   cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
     
     if cart_item && cart_item[:count] >= coupons[index][:num]
       if cart_item_with_coupon
         cart_item_with_coupon[:count] += coupons[index][:num]
         cart_item[:count] -= coupons[index][:num]
       else
         cart_item_with_coupon = {
           :item => coupon_item_name,
           :price => coupons[index][:cost]/coupons[index][:num],
           :count => coupons[index][:num],
           :clearance => cart_item[:clearance]
         }
         cart << cart_item_with_coupon
         cart_item[:count] -= coupons[index][:num]
       end
       end
  index += 1
end
cart
end

def apply_clearance(cart)
  index = 0 
  while index < cart.length do
    if cart[index][:clearance]
  cart[index][:price] = (cart[index][:price] - (cart[index][:price] * 0.20)).round(2)
end
  index += 1
end
cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  total = 0 
  index = 0 
  while index < final_cart.length do 
    total += final_cart[index][:price] * final_cart[index][:count]
  if total > 100
    total -= (total*0.10)
  end
  index += 1 
 end 
 return total
end
