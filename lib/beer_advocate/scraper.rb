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
      if counter > 2 && counter < 13
        beer_hash = parse_element(beer);
        results << beer_hash
      end
    end
    results
  end

  def self.parse_element(element)
    {
      name: element.children[1].children[0].children[0].children[0].text,
      brewery: element.children[1].children[1].children[0].text,
      style: element.children[1].children[1].children[2].text,
      abv: element.children[1].children[1].children[3].text,
      rank: element.children[0].text,
      url: element.children[1].children[0].attribute("href").value,
      rating: element.children[2].children[0].text
    }
  end

  def self.scrape_description(url)
    doc = Nokogiri::HTML(open('https://beeradvocate.com'+url))
    text = doc.css('#ba-content > div:nth-child(4) > div:nth-child(2)').text
    description = text.split("\n")[19].strip
  end
end
