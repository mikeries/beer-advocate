class BeerAdvocate::Beer
  attr_accessor :name, :rank, :brewery, :style, :abv, :rating, :url
  attr_writer :description

  @@all=[]

  def initialize(beer_hash)
    beer_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def description
    @description = @description || BeerAdvocate::Scraper.scrape_description(self.url)
  end

  def self.all
    if @@all.count==0
      BeerAdvocate::Scraper.scrape_beers.each {|hash| BeerAdvocate::Beer.new(hash)}
    end
    @@all
  end
end
