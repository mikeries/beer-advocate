class BeerAdvocate::Beer
  attr_accessor :name, :rank, :brewery, :style, :abv, :rating, :url, :description

  @@all=[]

  def initialize(name)
    @name = name
    save
    self
  end

  def self.create_beer_from_hash(beer_hash)
    beer = BeerAdvocate::Beer.new(beer_hash[name]);
    beer_hash.each {|key, value| beer.send(("#{key}="), value)}
  end

  def save
    @@all << self
  end

  def details
    self.description = "This beer was conceived with the intent to push the concept of Doppelganger to
    the limit of flavor and intensity. Both the kettle hopping rates and dry hopping
    rates were increased while keeping the base beer the same. The result is intense,
    but also surprising in its balance and softness. The mouthfeel is viscous and
    coating with flavors of overripe mango, dank citrus, and tropical fruit
    balanced by a sharp but pleasant finish. A treat to warm you up as a true New
    England winter takes hold!"
  end

  def self.all
    if @@all.count == 0
      BeerAdvocate::Scraper.scrape_beers.each {|beer| self.create_beer_from_hash(beer)}
    end

    @@all
  end
end
