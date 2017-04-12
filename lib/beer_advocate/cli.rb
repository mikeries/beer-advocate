class BeerAdvocate::CLI

  def self.start
    menu
    get_input
  end

  def self.menu
    puts "BeerAdvocate.com's Top 10 Beers of All Time"
    puts "-------------------------------------------"
    @beers = BeerAdvocate::Beer.all
    @beers.each do |beer|
      puts "#{beer.rank}. #{beer.name}, #{beer.style}, #{beer.rating}"
    end
    puts "-------------------------------------------"
  end

  def self.get_input
    puts "Please enter a number for more information, or 'exit' to quit."
    while (input = gets.strip) != "exit" do
      if input == 'list'
        menu
      elsif input.to_i.between?(1,10)
        show_beer_details(@beers[input.to_i-1])
      else
        puts "I don't recognize that command.  Please try again."
      end
    end
  end

  def self.show_beer_details(beer)
    puts ""
    puts "Name: #{beer.name}"
    puts "Brewed by: #{beer.brewery}"
    puts "Style: #{beer.style} #{beer.abv}"
    puts "Description: #{beer.description}"
    puts ""
    puts "Please enter 'list' to review the top-ten, or type 'exit'."
  end
end
