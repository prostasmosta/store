class Cart
  def initialize
    @products = []
  end

  def total
    @products.sum(&:price)
  end

  def <<(new_product)
    @products << new_product
  end

  def to_s
    @products.tally.map.with_index(1) do |(product, quantity), index|
      "#{index}. #{product} - #{quantity} шт."
    end.join("\n")
  end
end
