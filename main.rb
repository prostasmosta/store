require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir("#{__dir__}/data")
collection.sort!(by: :price, order: :asc)

cart = Cart.new

loop do
  puts
  puts 'What do you want to buy?'
  puts
  puts collection
  puts '0. Exit'

  buyers_select = STDIN.gets.to_i

  break if buyers_select <= 0

  chosen_product = collection[buyers_select]

  next if chosen_product.nil?

  cart << chosen_product
  chosen_product.quantity -= 1

  collection.remove_out_of_stock!

  puts "You selected: #{chosen_product}"
  puts "You've selected products for: #{cart.total} rub."
end

puts 'You bought:'
puts cart
puts
puts "To be paid: #{cart.total} rub. Thanks for shopping!"
