class BeerAdvocate::CLI

  def self.start
    welcome
    menu
    get_input
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

  def self.get_input
    puts "Please enter a number for more information, or 'exit' to quit."
    while (input = gets.strip) != "exit" do
      if input == 'list'
        menu
      elsif input.to_i.between?(1,10)
        show_beer_details
      else
        puts "I don't recognize that command.  Please try again."
      end
    end
  end

  def self.show_beer_details
    puts "Doubleganger"
    puts "Brewed by: Tree House Brewing Company"
    puts "Style: American Double / Imperial IPA, 8.2% ABV"
    puts "This beer was conceived with the intent to push the concept of Doppelganger to
the limit of flavor and intensity. Both the kettle hopping rates and dry hopping
rates were increased while keeping the base beer the same. The result is intense,
but also surprising in its balance and softness. The mouthfeel is viscous and
coating with flavors of overripe mango, dank citrus, and tropical fruit
balanced by a sharp but pleasant finish. A treat to warm you up as a true New
England winter takes hold!"
    puts ""
    puts "Please enter 'list' to review the top-ten, or type 'exit'."
  end
end
