require 'nokogiri'
require 'open-uri'
require 'pry'

class NbaScoreboard::Scraper

  def self.scrape_games
    doc = Nokogiri::HTML(open("http://www.basketball-reference.com/boxscores/"))
    game_num = doc.search("td.align_left.valign_top").count
    scraped_games = []
    i = 0
    while i < game_num
      matchup_array = doc.css(".no_highlight .wide_table")[3*i].text.gsub(/^$\n/,'').split("\n")
      away_team = matchup_array[0]
      away_score = matchup_array[1]
      home_team = matchup_array[3]
      home_score = matchup_array[4]
      game_matchup = "#{away_team} vs #{home_team}"
      game_status = matchup_array[2]
      game_score = "#{away_team}--#{away_score} vs #{home_team}--#{home_score} #{game_status}"
      scraped_games << {matchup: game_matchup, score: game_score, status: game_status}
      i += 1
    end
    scraped_games
  end

end