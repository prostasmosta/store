class Disk < Product

  def self.from_file(path)
    read_params = File.readlines("/#{path}", chomp: true)

    self.new(
      title: read_params[0],
      performer: read_params[1],
      genre: read_params[2],
      year: read_params[3],
      price: read_params[4],
      quantity: read_params[5]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @performer = params[:performer]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Album '#{@title}', band - #{@performer}, #{@genre}, #{@year}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @performer = params[:performer] if params[:performer]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end
