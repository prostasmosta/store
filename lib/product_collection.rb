class ProductCollection

  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book},
    disk: {dir: 'disks', class: Disk}
  }.freeze

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []
    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]
      Dir["#{dir_path}/#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end
    self.new(products)
  end

  def to_a
    @products
  end

  def to_s
    @products.map.with_index(1) do |product, number|
      "#{number}. #{product}"
    end.join("\n")
  end

  def [](product_index)
    @products[product_index - 1]
  end

  def remove_out_of_stock!
    @products.select! { |product| product.quantity > 0 }
  end

  def sort!(params)
    case params[:by]
    when :title
      #@products.sort_by!(&:to_s)
      @products.sort_by!(&:to_s)
    when :price
      # {|product| product.price}
      @products.sort_by!(&:price)
    when :quantity
      @products.sort_by!(&:quantity)
    end
    @products.reverse! if params[:order] == :asc
    self
  end
end
