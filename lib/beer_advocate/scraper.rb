require 'open-uri'

class BeerAdvocate::Scraper
  ROOT_URL = "https://www.beeradvocate.com"

  #IDEA: Generalize scrape_beers to accept argument of the starting beer to
  #      scrape, and modify cli to permit user to choose where to start, or
  #      scroll down the entire list of 250 beers.
  def self.scrape_beers
    doc = Nokogiri::HTML(open(ROOT_URL+'/lists/top/'))
    rows = doc.css('#ba-content table tr')

    results = (3..12).collect {|index| parse_row(rows[index-1])}
  end

  def self.parse_row(row)
    {
      name: row.children[1].children[0].children[0].children[0].text,
      brewery: row.children[1].children[1].children[0].text,
      style: row.children[1].children[1].children[2].text,
      abv: row.children[1].children[1].children[3].text,
      rank: row.children[0].text,
      url: row.children[1].children[0].attribute("href").value,
      rating: row.children[2].children[0].text
    }
  end

  def self.scrape_description(url)
    doc = Nokogiri::HTML(open(ROOT_URL+url))
    text = doc.css('#ba-content > div:nth-child(4) > div:nth-child(2)').text

    # sample result for text:
    #  "\n\t\t\n\t\t\t\t\n\n\t\tBEER INFO\n\n\t\t\n\t\tBrewed by:\n\t\t\n\t\tTree
    #  House Brewing Company\n\t\tMassachusetts, United Statestreehousebrew.com\t\t\n\t\t
    #  Style: American Double / Imperial IPA\n\t\t\n\t\tAlcohol by v
    #  olume (ABV): 8.60%\n\t\t\n\t\tAvailability: Rotating\n\t\t\n\t\tNotes /
    #  Commercial Description:\n\t\t\n\t\tA kicked up version of Haze, Very Hazy
    #  is a beer that makes us Very Happy! Very Hazy conveys all the beautiful fla
    #  vors of Haze, but with even greater depth and potency. Pungent grapefruit
    #  notes greet your palate while an underlying current of soft tropical fruit
    #  dances in the background. Just the right amount of bitterness balances t
    #  he sweet fruit flavors while a velvety soft mouthfeel make you easily (and
    #  dangerously!) forget this one clocks in at 8.6% ABV. A huge and beautiful 
    #  beer that maintains softness and delicacy - a beer we are very excited a
    #  bout!Added by ThatsThatDude on 11-22-2014\t\t\n\t"
    description = text.split("\n")[19].split(/(.*)Added by.*/)[1].strip
  end
end
