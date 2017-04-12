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

  def details
    description = "This beer was conceived with the intent to push the concept of Doppelganger to 
    the limit of flavor and intensity. Both the kettle hopping rates and dry hopping 
    rates were increased while keeping the base beer the same. The result is intense, 
    but also surprising in its balance and softness. The mouthfeel is viscous and 
    coating with flavors of overripe mango, dank citrus, and tropical fruit 
    balanced by a sharp but pleasant finish. A treat to warm you up as a true New 
    England winter takes hold!"
  end

  def self.all
    if @@all.count == 0
      beer = BeerAdvocate::Beer.new("Doubleganger")
      beer.style = "American Double / Imperial IPA"
      beer.rating = 4.61
      beer.brewery = "Tree House Brewing Company"
      beer.abv = "8.20% ABV"
      beer.rank = 1

      beer = BeerAdvocate::Beer.new("Curiousity Twenty Seven")
      beer.style = "American Double / Imperial IPA"
      beer.rating = 4.53
      beer.brewery = "Tree House Brewing Company"
      beer.abv = "8.00% ABV"
      beer.rank = 2
    end

    @@all
  end
end