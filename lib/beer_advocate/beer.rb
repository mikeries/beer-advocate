class BeerAdvocate::Beer
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

  def self.all
    if @@all.count == 0
      beer = BeerAdvocate::Beer.new("Doubleganger")
      beer.style = "American Double / Imperial IPA"
      beer.rating = 4.61
      beer.rank = 1

      beer = BeerAdvocate::Beer.new("Curiousity Twenty Seven")
      beer.style = "American Double / Imperial IPA"
      beer.rating = 4.53
      beer.rank = 2
    end

    @@all
  end
end