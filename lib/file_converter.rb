class FileConverter

  attr_reader :games,
              :teams,
              :game_teams

  def initialize(files)
    @games_file = files[:games]
    @games = convert_games
    @teams_file = files[:teams]
    @teams = convert_teams
    @game_teams_file = files[:game_teams]
  end

  def parse_csv(file)
    CSV.open(file, headers: true, header_converters: :symbol) #converters: :numeric
  end

  def convert_games
    game_data = parse_csv(@games_file)
    game_data.map do |game|
      Game.new(game)
    end
  end

  def convert_teams
    teams_data = parse_csv(@teams_file)
    teams_data.map do |team|
      Team.new(team)
    end
  end

end
