require 'open-uri'
require 'pry'
require 'nokogiri'

class Scoreboard::Games

  attr_accessor :games, :num_games, :matchup, :score, :status, :matchup_array, :away_team, :away_score, :home_team, :home_score

  def self.today
    # ***** Scrape games and then return games based on that data *****
    # Scoreboard::GameScraper.new("http://www.basketball-reference.com/boxscores/")

    self.scrape_scores

    # game_1 = self.new
    # game_1.matchup = "NBA-- GSW vs Hou"
    # game_1.score = "NBA-- GSW 75 Hou 61"
    # game_1.in_progress = true
    # game_1.url = "http://stats.nba.com/scores/"

    # game_2 = self.new
    # game_2.matchup = "NBA-- SA vs Mem"
    # game_2.score = "NBA-- SA 24 Mem 11"
    # game_2.in_progress = true
    # game_2.url = "http://stats.nba.com/scores/"

    # [game_1, game_2]

  end

  # def self.scrape_games
  #   games = []
  #   games << self.scrape_scores
  #   games
  # end


  def self.scrape_games
    doc = Nokogiri::HTML(open("http://www.basketball-reference.com/boxscores/"))
    game_num = doc.search("td.align_left.valign_top").count
    scraped_games = []
    i = 0
    while i <= game_num
      matchup_array = doc.css(".no_highlight .wide_table")[3*i].text.gsub(/^$\n/,'').split("\n")
      away_team = matchup_array[0]
      away_score = matchup_array[1]
      home_team = matchup_array[3]
      home_score = matchup_array[4]
      game_matchup = "#{away_team} vs #{home_team}"
      game_status = matchup_array[2]
      game_score = "#{away_team}--#{away_score} vs #{home_team}--#{home_score} (#{status})"
      scraped_games << {matchup: game_matchup, score: game_score, status: game_status}
      i += 1
    end
    scraped_games
  end

end