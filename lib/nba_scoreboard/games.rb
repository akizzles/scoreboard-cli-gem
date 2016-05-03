class NbaScoreboard::Games

  attr_accessor :game_num, :matchup, :score, :status
  @@all = []

  def initialize(games_hash)
    games_hash.each {|k, v| self.send("#{k}=", v)}
    self.class.all << self
  end


  def self.today(games_array)
    games_array.each {|games_hash| NbaScoreboard::Games.new(games_hash)}
  end

  def self.all
    @@all
  end

end