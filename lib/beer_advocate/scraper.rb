require 'open-uri'
require 'pry'

class BeerAdvocate::Scraper
  def self.scrape_beers
    doc = Nokogiri::HTML(open('https://www.beeradvocate.com/lists/top/'))
    beers = doc.css('#ba-content table tr')
    counter = 0;
    results=[]
    beers.each do |beer|
      counter+=1
      if counter > 2 && counter < 4
        beer_hash = {
          name: beer.children[1].children[0].children[0].children[0].text,
          brewery: beer.children[1].children[1].children[0].text,
          style: beer.children[1].children[1].children[2].text,
          abv: beer.children[1].children[1].children[3].text,
          rank: counter-2,
          url: beer.children[1].children[0].attribute("href").value
        }
        results << beer_hash
        binding.pry
      end
    end
  end
end