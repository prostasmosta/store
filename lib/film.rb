class Film < Product

  def self.from_file(path)
    read_params = File.readlines("/#{path}", chomp: true)

    self.new(
      title: read_params[0],
      director: read_params[1],
      year: read_params[2],
      price: read_params[3],
      quantity: read_params[4]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Film '#{@title}', #{@year}, director #{@director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end
