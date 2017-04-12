class BeerAdvocate::CLI

  def self.start
    welcome
    menu
  end

  def self.welcome
    puts "BeerAdvocate.com's Top 10 Beers of All Time"
    puts "-------------------------------------------"
  end

  def self.menu
    puts "1. Doubleganger, American Double / Imperial IPA, 4.61"
    puts "2. Curiosity Twenty Seven, American Double / Imperial IPA, 4.53"
    puts "3. Derivation 6 (Cinnamon, Cocoa Nibs And Ugandan Vanilla), American Double / Imperial Stout, 4.53"
    puts "4. Double Dry Hopped Double Mosaic Dream, American Double / Imperial IPA 4.52"
    puts "5. Double Shot - Costa Rica Montes De Oro, American Stout, 4.52"
    puts "6. 3rd Anniversary Imperial IPA, American Double / Imperial IPA, 4.5"
    puts "7. Double Shot- Batch 500, American Stout, 4.48"
    puts "8. Infinity + ONE, American Double / Imperial IPA, 4.46"
    puts "9. The Streets, American Double / Imperial IPA, 4.46"
    puts "10. Bourbon Barrel Oro Negro, American Double / Imperial Stout, 4.46"
  end
end
