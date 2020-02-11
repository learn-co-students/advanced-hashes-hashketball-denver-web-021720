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

def num_points_scored(player_name)
  master_hash = game_hash

  master_hash.each_pair do |(side, attribute)|
    attribute[:players].each do |player|
      if player[:player_name] == player_name
        return player[:points]
      end
    end
  end
end

def shoe_size(player_name)
  master_hash = game_hash

  master_hash.each_pair do |(side, attribute)|
    attribute[:players].each do |player|
      if player[:player_name] == player_name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  master_hash = game_hash
  
  master_hash.each_pair do |(side, attribute)|
    if attribute[:team_name] == team_name
      return attribute[:colors]
    end
  end
end

def team_names
  master_hash = game_hash
  array = []
  
  master_hash.each_pair do |(side, attribute)|
    array << attribute[:team_name]
  end
  
  array
end

def player_numbers(team_name)
  master_hash = game_hash
  player_numbers = []

  master_hash.each_pair do |(side, attribute)|
    if attribute[:team_name] != team_name
      next
    end
    
    attribute[:players].each do |player|
      player_numbers << player[:number]
    end
  end
  
  player_numbers
end

def player_stats(player_name)
  master_hash = game_hash
  
  master_hash.each_pair do |(side, attribute)|
    attribute[:players].each do |player|
      if player[:player_name] == player_name
        return {
          :number => player[:number],
          :shoe => player[:shoe],
          :points => player[:points],
          :rebounds => player[:rebounds],
          :assists => player[:assists],
          :steals => player[:steals],
          :blocks => player[:blocks],
          :slam_dunks => player[:slam_dunks]
        }
      end
    end
  end
end

def big_shoe_rebounds
  master_hash = game_hash
  biggest_shoe = 0 
  rebounds = 0 
  
  master_hash.each_pair do |(side, attribute)|
    attribute[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  
  rebounds
end

def most_points_scored
  master_hash = game_hash
  most_points = 0 
  mvp_name = nil 

  master_hash.each_pair do |(side, attribute)|
    attribute[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        mvp_name = player[:player_name]
      end
    end
  end
  
  mvp_name
end

def winning_team
  master_hash = game_hash
  home_team = 0
  away_team = 0 
  home_team_name = nil 
  away_team_name = nil 
  
  master_hash.each_pair do |(side, attribute)|
    if side == :home
      home_team_name = attribute[:team_name]
      attribute[:players].each do |player|
        home_team += player[:points]
      end
    else
      away_team_name = attribute[:team_name]
      attribute[:players].each do |player|
        away_team += player[:points]
      end
    end
  end
  
  if home_team > away_team 
    return home_team_name
  else 
    return away_team_name
  end
end

def player_with_longest_name
  master_hash = game_hash
  max_name_length = 0 
  max_name = nil 
  
  master_hash.each_pair do |(side, attribute)|
    attribute[:players].each do |player|
      if player[:player_name].length > max_name_length
        max_name_length = player[:player_name].length 
        max_name = player[:player_name]
      end
    end
  end
  
  max_name
end

def long_name_steals_a_ton?
  master_hash = game_hash
  max_steals = 0 
  max_steals_name = nil 
  
  master_hash.each_pair do |(side, attribute)| 
    attribute[:players].each do |player|
      if player[:steals] > max_steals 
        max_steals = player[:steals]
        max_steals_name = player[:player_name]
      end
    end
  end
  
  max_steals_name == player_with_longest_name
end