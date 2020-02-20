require 'pry'

def game_hash
  {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => [{
        :player_name => 'Alan Anderson',
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
        :player_name => 'Reggie Evans',
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
      :players => [{
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
        :points => 12,
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
end

# array of players helper method
def players
  game_hash[:away][:players].concat(game_hash[:home][:players])
  
end

def teams
  game_hash.values
end

def find_player (name)
  players.find do |player|
    player[:player_name] == name
  end
end

def num_points_scored(name)
  find_player(name)[:points]
end 

def shoe_size(name)
  find_player(name)[:shoe]
end

def team_colors(name)
  teams.find do |team|
    team[:team_name] == name
  end[:colors]
end

def team_names
  teams.map { |team| 
    team[:team_name]
  }
end 

def team_player_stats(sought_team)
  teams.find do |team| 
    team[:team_name] == sought_team
  end[:players]
end

def player_numbers(sought_team)
  team_player_stats(sought_team).map { |player| 
player[:number]
}
end 

def player_stats(name)
  result = {}
  players.find do |player|
    player[:player_name] == name
    result = player.delete_if { |key, value|
    key == :player_name }
  end 
  return result 
end

def highest_statistic(stat, value_to_be_returned)
  high_stat = 0
  return_value = nil

  players.each { |player|
  if player[stat].is_a? String
    if player[stat].length > high_stat
      high_stat = player[stat].length
      return_value = player[:player_name]
    end 
  elsif player[stat] > high_stat
    high_stat = player[stat]
    return_value = player[value_to_be_returned]
  end
}
return_value
end 

def big_shoe_rebounds
  highest_statistic(:shoe, :rebounds)
end

def most_points_scored
  highest_statistic(:points, :player_name)
end 

def team_points(site) 

  total_points = 0
 
  game_hash.each do |place, team|
    if place == site
      team.each do |attribute, data| 
        if attribute == :players
          data.each do |player| 
          total_points += player[:points]
          end
        end 
      end
    end
  end  
     total_points
end


def winning_team 

home_team = ""  
away_team = ""

game_hash.each { |place, team|
    if place == :home
      home_team = team[:team_name]
    else 
      away_team = team[:team_name]
    end 
    }
  
home_total_points = team_points(:home)
away_total_points = team_points(:away)

home_total_points > away_total_points ? home_team : away_team

end 

def player_with_longest_name
  highest_statistic(:player_name, :player_name)
end 

def most_steals
  highest_statistic(:steals, :player_name)
end 

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end 


# def player_with_longest_name
#   longest_name = 0
#   long_name = ""
  
#   game_hash.each { |place, team| 
#    team.each { |attribute, data| 
#      if attribute == :players
#        data.each { |player| 
#          if player[:player_name].length > longest_name
#            longest_name = player[:player_name].length
#            long_name = player[:player_name]
#          end
#        }
#      end 
#    }
#  }
#   return long_name
# end 

# def most_points_scored
#   high_points = 0
#   high_scorer = ""
  
#   game_hash.each { |place, team| 
#    team.each { |attribute, data| 
#      if attribute == :players
#        data.each { |player| 
#          if player[:points] > high_points
#            high_points = player[:points]
#            high_scorer = player[:player_name]
#          end
#        }
#      end 
#    }
#  }
#   return high_scorer
# end 

# def big_shoe_rebounds
#   biggest_shoe = 0 
#   rebounds = 0 
  
#   game_hash.each { |place, team| 
#    team.each { |attribute, data| 
#      if attribute == :players
#        data.each { |player| 
#          if player[:shoe] > biggest_shoe
#            biggest_shoe = player[:shoe]
#            rebounds = player[:rebounds]
#          end
#        }
#      end 
#    }
#  }
#  return rebounds
# end 


# def player_stats(players_name)
#   result = {}
#   game_hash.each { |place, team| 
#    team.each { |attribute, data| 
#      if attribute == :players
#        data.each { |player| 
#          if player[:player_name] == players_name
#            result = player.delete_if { |key, value|
#            key == :player_name }
#          end
#        }
#      end 
#    }
#  }
#  return result
# end 


# def player_numbers(sought_team)
#   numbers = []
#    game_hash.each { |place, team| 
#      if team[:team_name] == sought_team
#        team.each { |attribute, data| 
#        if attribute == :players
#         data.each { |player| 
#         numbers << player[:number]
#         }
#         end
#         }
#       end
#        }
#   return numbers
# end 



# def num_points_scored(players_name)
#   game_hash.each { |place, team| 
#    team.each { |attribute, data| 
#      if attribute == :players
#        data.each { |player| 
#          if player[:player_name] == players_name
#            return player[:points]
#          end
#        }
#      end 
#    }
#  }
# end 



# def shoe_size(players_name)
#    game_hash.each { |place, team| 
#    team.each { |attribute, data| 
#      if attribute == :players
#        data.each { |player| 
#          if player[:player_name] == players_name
#            return player[:shoe]
#          end
#        }
#      end 
#    }
#  }
# end 

#helper method for above 
# def player_data(players_name, sought_data)
#   game_hash.each { |place, team| 
#   team.each { |attribute, data| 
#     if attribute == :players
#       data.each { |player| 
#         if player[:player_name] == players_name
#           return player[sought_data]
#         end
#       }
#     end 
#   }
# }  
# end


# def team_colors(sought_team)
#   game_hash.each { |place, team| 
#     if team[:team_name] == sought_team
#       return team[:colors]
#     end 
#   }
# end 