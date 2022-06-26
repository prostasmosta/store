class Book < Product

  def self.from_file(path)
    read_params = File.readlines("/#{path}", chomp: true)

    self.new(
      title: read_params[0],
      genre: read_params[1],
      author: read_params[2],
      price: read_params[3],
      quantity: read_params[4]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Book '#{@title}', #{@genre}, author - #{@author}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
