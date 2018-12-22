require './test/test_helper'
require './lib/team'
require './lib/game'
require './lib/league_stats'
require 'pry'

class TeamTest < Minitest::Test

  def setup
    team_1_info = {
      :team_id=>"1",
      :franchiseId=>"23",
      :shortName=>"New Jersey",
      :teamName=>"Devils",
      :abbreviation=>"NJD",
      :link=>"/api/v1/teams/1"
    }

    team_4_info = {
      :team_id=>"4",
      :franchiseId=>"16",
      :shortName=>"Philadelphia",
      :teamName=>"Flyers",
      :abbreviation=>"PHI",
      :link=>"/api/v1/teams/4"
    }

    team_26_info = {
      :team_id=>"26",
      :franchiseId=>"14",
      :shortName=>"Los Angeles",
      :teamName=>"Kings",
      :abbreviation=>"LAK",
      :link=>"/api/v1/teams/26"
    }

    team_3_info = {team_id: "3", franchiseId: "23", shortName: "", teamName: "Rangers", abbreviation: "NJD", link: "/api/v1/teams/1"}
    team_6_info = {team_id: "6", franchiseId: "16", shortName: "", teamName: "Bruins", abbreviation: "PHI", link: "/api/v1/teams/4"}

    @team_1 = Team.new(team_1_info)
    @team_3 = Team.new(team_3_info)
    @team_4 = Team.new(team_4_info)
    @team_6 = Team.new(team_6_info)
    @team_26 = Team.new(team_26_info)

    @teams = [
              @team_1,
              @team_3,
              @team_4,
              @team_6,
              @team_26
             ]

   game_1_info = {:game_id=>"2012030221", :season=>"20122013", :type=>"P", :date_time=>"2013-05-16", :away_team_id=>"3", :home_team_id=>"6", :away_goals=>"2", :home_goals=>"3", :outcome=>"home win OT", :home_rink_side_start=>"left", :venue=>"TD Garden", :venue_link=>"/api/v1/venues/		null", :venue_time_zone_id=>"America New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
   game_2_info = {:game_id=>"2012030222", :season=>"20122013", :type=>"P", :date_time=>"2013-05-19", :away_team_id=>"3", :home_team_id=>"6", :away_goals=>"2", :home_goals=>"5", :outcome=>"home win REG", :home_rink_side_start=>"left", :venue=>"TD Garden", :venue_link=>"/api/v1/venues/		null", :venue_time_zone_id=>"America New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
   game_3_info = {:game_id=>"2012030223", :season=>"20122013", :type=>"P", :date_time=>"2013-05-21", :away_team_id=>"6", :home_team_id=>"3", :away_goals=>"2", :home_goals=>"1", :outcome=>"away win REG", :home_rink_side_start=>"right", :venue=>"Madison Square Garden", :venue_link=>"/api/v1/	venues/null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
   game_4_info = {:game_id=>"2017020830", :season=>"20172018", :type=>"R", :date_time=>"2018-02-09", :away_team_id=>"23", :home_team_id=>"14", :away_goals=>"2", :home_goals=>"5", :outcome=>"home win REG", :home_rink_side_start=>"left", :venue=>"Amalie Arena", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
   game_5_info = {:game_id=>"2017020227", :season=>"20172018", :type=>"R", :date_time=>"2017-11-08", :away_team_id=>"13", :home_team_id=>"12", :away_goals=>"1", :home_goals=>"3", :outcome=>"home win REG", :home_rink_side_start=>"right", :venue=>"PNC Arena", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
   game_6_info = {:game_id=>"2016020050", :season=>"20162017", :type=>"R", :date_time=>"2016-10-20", :away_team_id=>"10", :home_team_id=>"52", :away_goals=>"4", :home_goals=>"6", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
   game_7_info = {:game_id=>"2013020674", :season=>"20132014", :type=>"R", :date_time=>"2014-01-11", :away_team_id=>"19", :home_team_id=>"23", :away_goals=>"1", :home_goals=>"2", :outcome=>"home win REG", :home_rink_side_start=>"right", :venue=>"Rogers Arena", :venue_link=>"/api/v1/venues/null", :venue_time_zone_id=>"America/Vancouver", :venue_time_zone_offset=>"-7", :venue_time_zone_tz=>"PDT"}
   game_8_info = {:game_id=>"2013020221", :season=>"20132014", :type=>"R", :date_time=>"2013-11-06", :away_team_id=>"22", :home_team_id=>"13", :away_goals=>"4", :home_goals=>"1", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
   game_9_info = {:game_id=>"2013020727", :season=>"20132014", :type=>"R", :date_time=>"2014-01-19", :away_team_id=>"8", :home_team_id=>"10", :away_goals=>"3", :home_goals=>"2", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
   game_10_info = {:game_id=>"2012020381", :season=>"20122013", :type=>"R", :date_time=>"2013-03-12", :away_team_id=>"14", :home_team_id=>"13", :away_goals=>"2", :home_goals=>"5", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
   game_11_info = {:game_id=>"2014020548", :season=>"20142015", :type=>"R", :date_time=>"2015-01-01", :away_team_id=>"12", :home_team_id=>"5", :away_goals=>"1", :home_goals=>"7", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
   game_12_info = {:game_id=>"2014020016", :season=>"20142015", :type=>"R", :date_time=>"2014-10-10", :away_team_id=>"52", :home_team_id=>"53", :away_goals=>"5", :home_goals=>"1", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
   game_13_info = {:game_id=>"test", :season=>"20142015", :type=>"R", :date_time=>"2014-10-10", :away_team_id=>"53", :home_team_id=>"52", :away_goals=>"1", :home_goals=>"0", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}

   @game_1 = Game.new(game_1_info)
   @game_2 = Game.new(game_2_info)
   @game_3 = Game.new(game_3_info)
   @game_4 = Game.new(game_4_info)
   @game_5 = Game.new(game_5_info)
   @game_6 = Game.new(game_6_info)
   @game_7 = Game.new(game_7_info)
   @game_8 = Game.new(game_8_info)
   @game_9 = Game.new(game_9_info)
   @game_10 = Game.new(game_10_info)
   @game_11 = Game.new(game_11_info)
   @game_12 = Game.new(game_12_info)
   @game_13 = Game.new(game_13_info)

   @games = [
             @game_1,
             @game_2,
             @game_3,
             @game_4,
             @game_5,
             @game_6,
             @game_7,
             @game_8,
             @game_9,
             @game_10,
             @game_11,
             @game_12,
             @game_13
            ]

   @league_stats = LeagueStats.new(@games, @teams)
  end

  def test_it_exists
    assert_instance_of Team, @team_1
  end

  def test_it_has_attributes
    assert_equal "1", @team_1.team_id
    assert_equal "23", @team_1.franchise_id
    assert_equal "New Jersey", @team_1.short_name
    assert_equal "Devils", @team_1.team_name
    assert_equal "NJD", @team_1.abbreviation
    assert_equal "/api/v1/teams/1", @team_1.link
  end
#A hash with key/value pairs
#for each of the attributes of a team.
  def test_it_has_team_info
    hash = {:team_id => "1", :franchiseId=>"23", :shortName=>"New Jersey", :teamName=>"Devils", :abbreviation=>"NJD", :link=>"/api/v1/teams/1"}

    assert_equal hash, @team_1.team_info
  end

  def test_league_stats_start_with_0
    assert_equal 0, @team_1.home_wins_league
    assert_equal 0, @team_1.away_wins_league
    assert_equal 0, @team_1.away_goals_league
    assert_equal 0, @team_1.home_goals_league
    assert_equal 0, @team_1.total_wins_league
    assert_equal 0, @team_1.total_games_league
    assert_equal 0, @team_1.total_goals_league
    assert_equal 0, @team_1.total_goals_allowed_league
  end

  def test_it_calculates_offense
    @league_stats.sort_total_league_games

    assert_equal 1.67, @team_3.calculate_offense
  end

  def test_it_calculates_defense
    @league_stats.sort_total_league_games

    assert_equal 3.33, @team_3.calculate_defense
  end

  def test_it_calculates_team_league_away_average_goals
    @league_stats.sort_total_league_games

    assert_equal 2, @team_3.league_away_average_goals
  end

  def test_it_calculates_team_league_home_average_goals
    @league_stats.sort_total_league_games

    assert_equal 4, @team_6.league_home_average_goals
  end

  def test_it_calculates_team_league_win_percentage
    @league_stats.sort_total_league_games

    assert_equal 0.0, @team_3.league_win_percentage
    assert_equal 1.0, @team_6.league_win_percentage
  end

  def test_it_calculates_team_home_league_win_percentage
    @league_stats.sort_total_league_games

    assert_equal 0.0, @team_3.league_home_win_percentage
    assert_equal 1.0, @team_6.league_home_win_percentage
  end

  def test_it_calculates_team_away_league_win_percentage
    @league_stats.sort_total_league_games

    assert_equal 0.0, @team_3.league_away_win_percentage
    assert_equal 1.0, @team_6.league_away_win_percentage
  end

  def test_it_calculates_fan_rating
    @league_stats.sort_total_league_games

    assert_equal 0.0, @team_3.league_win_percentage
    assert_equal 1.0, @team_6.league_win_percentage
  end

end
