class BeerAdvocate::CLI

  def self.start
    menu
    get_input
  end

  def self.menu
    puts "BeerAdvocate.com's Top 10 Beers of All Time"
    puts "-------------------------------------------"
    BeerAdvocate::Beer.all.each do |beer|
      puts "#{beer.rank}. #{beer.name}, #{beer.style}, #{beer.rating}"
    end
    puts "-------------------------------------------"
  end

  def self.get_input
    input=nil
    until input=='exit'
      puts "Please enter a number for details, 'list' to review the top ten, or 'exit' to quit."
      input = gets.strip.downcase
      if input == 'list'
        menu
      elsif input.to_i.between?(1,10)
        show_beer_details(input)
      elsif input == 'exit'
        goodbye
      else
        puts "I don't recognize that command.  Please try again."
      end
    end
  end

  def self.show_beer_details(selection)
    beer = BeerAdvocate::Beer.find(selection.to_i)
    puts ""
    puts "Name: #{beer.name}"
    puts "Brewed by: #{beer.brewery}"
    puts "Style: #{beer.style} #{beer.abv}"
    puts "Description: #{beer.description}"
    puts ""
  end

  def self.goodbye
    puts ""
    puts "Thanks for stopping by!  Don't drink them all in one night!"
  end
end
