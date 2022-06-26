class Product
  attr_accessor :price, :quantity

  def self.from_file(path)
    raise NotImplementedError
  end

  def initialize(params)
    @price = params[:price].to_i
    @quantity = params[:quantity].to_i
  end

  def to_s
    "#{@price} rub., (#{@quantity} pieces left)"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @quantity = params[:quantity] if params[:quantity]
  end
end
