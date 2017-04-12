class BeerAdvocate::BeerAdvocate
  attr_accessor :name, :rank, :brewery, :style, :abv, :rating, :url, :description

  @@all=[]

  def initialize(name)
    @name = name
    save
    self
  end

  def save
    @@all << self
  end
end