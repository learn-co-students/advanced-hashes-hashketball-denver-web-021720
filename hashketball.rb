def game_hash 
  game_hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => [
        {
          :player_name => 'Alan Anderson',
          :number => 0,
          :shoe => 16,
          :points =>22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        },
        {
          :player_name => 'Reggie Evans',
          :number => 30,
          :shoe => 14,
          :points =>12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 
        },
        {
          :player_name => 'Brook Lopez',
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
          :player_name => 'Mason Plumlee',
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
          :player_name => 'Jason Terry',
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
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => [
        {
          :player_name => 'Jeff Adrien',
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
          :player_name => 'Bismack Biyombo',
          :number => 0,
          :shoe => 16,
          :points =>12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        },
        {
          :player_name => 'DeSagna Diop',
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
          :player_name => 'Ben Gordon',
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
          :player_name => 'Kemba Walker',
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
  
  game_hash
end

def num_points_scored(players_name)
  master_hash = game_hash
  
  master_hash.each do |(key, value)|
    value.each do |(key2, value2)|
      if key2 == :players
        value2.each do |(key3, value3)|
          if key3[:player_name] == players_name
            return key3[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  master_hash = game_hash
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :players
        value.each do |(player, value2)|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  master_hash = game_hash
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :team_name && value == team_name
        return team[:colors]
      end
    end
  end
end

def team_names
  master_hash = game_hash
  team_names = []
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :team_name
        team_names << value
      end
    end
  end
  
  team_names
end

def player_numbers(team_name)
  master_hash = game_hash
  jersey_numbers = []
  
  master_hash.each do |key, team|
    team.each do |(attribute, value)|
      if attribute == :team_name && value == team_name
        team[:players].each do |(player, value2)|
          jersey_numbers << player[:number]
        end
      end
    end
  end
  
  jersey_numbers
end

def player_stats(player_name)
  master_hash = game_hash 

  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :players 
        value.each do |(player, value2)|
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
  end
end

def big_shoe_rebounds
  master_hash = game_hash
  biggest_shoe = 0 
  player_with_biggest_shoe = nil
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :players 
        value.each do |(player, value2)|
         if player[:shoe] > biggest_shoe
           biggest_shoe = player[:shoe]
           player_with_biggest_shoe = player[:player_name]
         end
        end
      end
    end
  end
  
  big_shoe_stats = player_stats(player_with_biggest_shoe)
  
  big_shoe_stats[:rebounds]
end

def most_points_scored
  master_hash = game_hash
  points_total = 0 
  mvp = nil 
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :players 
        value.each do |(player, value2)|
         if player[:points] > points_total
           points_total = player[:points]
           mvp = player[:player_name]
         end
        end
      end
    end
  end
  
  mvp
end

def winning_team
  master_hash = game_hash
  team_home = {:total_points => 0} 
  team_away = {:total_points => 0} 
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :team_name
        if key == :home
          team_home[:team_name] = value
        else
          team_away[:team_name] = value 
        end
      elsif attribute == :players 
        value.each do |(player, value2)|
          if key == :home 
            team_home[:total_points] += player[:points]
          else 
            team_away[:total_points] += player[:points]
          end
        end
      end
    end
  end
  
  team_away[:total_points] > team_home[:total_points] ? team_away[:team_name] : team_home[:team_name]
end

def player_with_longest_name
  master_hash = game_hash
  name_length_max = 0 
  longest_name = nil 
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :players 
        value.each do |(player, value2)|
          if player[:player_name].length > name_length_max
            name_length_max = player[:player_name].length 
            longest_name = player[:player_name]
          end
        end
      end
    end
  end
  
  longest_name
end

def long_name_steals_a_ton?
  master_hash = game_hash
  name_steals = nil 
  steals_max = 0
  
  master_hash.each do |(key, team)|
    team.each do |(attribute, value)|
      if attribute == :players
        value.each do |(player, value2)|
          if player[:steals] > steals_max
            steals_max = player[:steals]
            name_steals = player[:player_name]
          end
        end
      end
    end
  end
  
  player_with_longest_name == name_steals
end