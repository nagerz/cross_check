class GameStats

  attr_reader :games,
              :seasons,
              :venues

  def initialize(games)
    @games = games
    @seasons = []
    @venues = []
  end

  def list_seasons
    @games.each do |game|
      @seasons << game.season
    end
    @seasons.uniq!.sort!
  end

  def games_by_season
    @games.group_by do |game|
      game.season
    end
  end

  def list_season_games
    season_games = {}
    games_by_season.each do |season, games|
      season_games[season] = games.count
    end
    season_games
  end

  def season_with_most_games
    most_games = list_season_games.values.max
    list_season_games.key(most_games)
  end

  def season_with_fewest_games
    fewest_games = list_season_games.values.min
    list_season_games.key(fewest_games)
  end

  def total_scores
    @games.map { |game| game.total_score }
  end

  def max_score
    total_scores.max
  end

  def min_score
    total_scores.min
  end

  def away_game_scores
    @games.map do |game|
      game.away_goals
    end
  end

  def home_game_scores
    @games.map do |game|
      game.home_goals
    end
  end

  def blowout
    games_blowouts = @games.map do |game|
      game.blowout
    end
    games_blowouts.max
  end

  def list_venues
    @games.each do |game|
      @venues << game.venue
    end
    @venues.uniq!.sort!
  end

  def games_by_venue
    @games.group_by do |game|
      game.venue
    end
  end

  def list_games_by_venue
    venues = {}
    games_by_venue.each do |venue, games|
      venues[venue] = games.size
    end
    venues
  end

  def venue_with_most_games
    most_games = list_games_by_venue.values.max
    list_games_by_venue.key(most_games)
  end

  def venue_with_fewest_games
    fewest_games = list_games_by_venue.values.min
    list_games_by_venue.key(fewest_games)
  end

  def total_season_goals
    season_goals = {}
    games_by_season.each do |season, games|
      season_goals[season] = games.sum do |game|
        game.total_score
      end
    end
    season_goals
  end

  def average_goals_by_season
    season_average = {}
    total_season_goals.each do |season, total|
      games = games_by_season[season].size
      season_average[season] = (total.to_f / games)
    end
    season_average
  end

  def average_game_goals
    average = total_scores.sum / @games.size.to_f
    average.round(2)
  end

  def wins_percentage(team)
    wins = @games.reject do |game|
      game.outcome[0..3] != team
    end
    percentage = wins.size / @games.size.to_f
    (percentage * 100).round(2)
  end
end