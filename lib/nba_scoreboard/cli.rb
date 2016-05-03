class NbaScoreboard::CLI
  def call
    puts "Today's Games:"
    list_games
    menu
    #list_scores
    #games
    goodbye
  end

  def list_games
    # here doc http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    games_array = NbaScoreboard::Scraper.scrape_games
    @games = NbaScoreboard::Games.today(games_array)
    @games.each.with_index(1) do |game, i|
      puts "#{i}. #{game[:matchup]}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the game you want to see the score or type 'exit'\n"

      input = gets.chomp

      if input.to_i > @games.count
        puts "\nThere are only #{@games.count} games tonight. Please pick a valid game.\n"
      elsif input.to_i > 0 && input.to_i <= @games.count
        the_game = @games[input.to_i-1]
        puts "\n#{the_game[:score]}\n"
      elsif input == "list"
        list_games
      end
    end
  end

  def goodbye
    puts "\nSee you tomorrow.\n"
  end

end