def game_hash
    hash = {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
          {
            :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          {
            :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          {
            :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          {
            :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          {
            :player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }]
      },
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => [
          {
            :player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          {
            :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          {
            :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          {
            :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          {
            :player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }]
      }
    }
    
    hash
  end

  def player_stat_reducer(stat)
    players.reduce do |max_player, player|
      player[stat] > max_player[stat] ? player : max_player
    end
  end

  def players
	  game_hash[:away][:players].concat(game_hash[:home][:players])
  end

  def team_data
	  game_hash.values
  end

  def find_player(player_name)
	  players.find do |player|
		  player[:player_name] == player_name
	  end
  end

  def num_points_scored(player_name)      
	  find_player(player_name)[:points]
  end
  
  def shoe_size(player_name)
	  find_player(player_name)[:shoe]
  end
  
  def team_colors(team_name)
	  team_data.find do |team|
		team[:team_name] == team_name
	  end[:colors]
  end

  def team_names
    team_data.map do |team|
	    team[:team_name]
    end
  end

  def player_numbers(team_name)
    current_team = team_data.find do |team|
      team[:team_name] == team_name
    end

    current_team[:players].map do |player|
      player[:number]
    end
  end
  
  def player_stats(player_name)
    player = find_player(player_name)
    player.delete(:player_name)
    player
  end

  def big_shoe_rebounds
    player_stat_reducer(:shoe)[:rebounds]
  end
  
  def most_points_scored
    player_stat_reducer(:points)[:player_name]
  end
  
  def winning_team
    team1 = team_data[0]
    team2 = team_data[1]

    team1_pts = team1[:players].reduce(0) do |total, player|
      total + player[:points]
    end

    team2_pts = team2[:players].reduce(0) do |total, player|
      total + player[:points]
    end

    team1_pts > team2_pts ? team1[:team_name] : team2[:team_name]
  end
  
  def player_with_longest_name
    players.reduce({:player_name => ""}) do |max_length_player, player|
      player[:player_name].length > max_length_player[:player_name].length ? player : max_length_player
    end[:player_name]
  end
  
  def long_name_steals_a_ton?
    player_stat_reducer(:steals)[:player_name] == player_with_longest_name
  end