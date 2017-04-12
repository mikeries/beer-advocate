class BeerAdvocate::Beer
  attr_accessor :name, :rank, :brewery, :style, :abv, :rating, :url
  attr_writer :description

  @@all=[]

  def self.create_beer_from_hash(beer_hash)
    beer = BeerAdvocate::Beer.new;
    beer_hash.each {|key, value| beer.send(("#{key}="), value)}
    @@all << beer
  end

  def description
    @description = @description || BeerAdvocate::Scraper.scrape_description(self.url)
  end

  def self.all
    if @@all.count == 0
      BeerAdvocate::Scraper.scrape_beers.each {|beer| self.create_beer_from_hash(beer)}
    end

    @@all
  end
end
