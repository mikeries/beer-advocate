require 'open-uri'
require 'pry'

class BeerAdvocate::Scraper
  def self.scrape_beers
    doc = Nokogiri::HTML(open('https://www.beeradvocate.com/lists/top/'))
    beers = doc.css('#ba-content table tr')
    counter = 0;
    name=[]
    beers.each do |beer|
      counter+=1
      if counter > 2 && counter < 12
        name<<beer.children[1].children[0].children[0].children[0].text
      end
    end
    name
  end
end