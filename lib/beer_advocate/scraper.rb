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
      if counter > 2 && counter < 12
        beer_hash = {
          name: beer.children[1].children[0].children[0].children[0].text
        }
        results << beer_hash
        binding.pry
      end
    end
  end
end