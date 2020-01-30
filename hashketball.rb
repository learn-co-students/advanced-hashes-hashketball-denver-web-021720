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

def num_points_scored(players_name)
  game_hash.each { |place, team| 
   team.each { |attribute, data| 
     if attribute == :players
       data.each { |player| 
         if player[:player_name] == players_name
           return player[:points]
         end
       }
     end 
   }
 }
end 

def shoe_size(players_name)
   game_hash.each { |place, team| 
   team.each { |attribute, data| 
     if attribute == :players
       data.each { |player| 
         if player[:player_name] == players_name
           return player[:shoe]
         end
       }
     end 
   }
 }
end 

def team_colors(sought_team)
  game_hash.each { |place, team| 
    if team[:team_name] == sought_team
      return team[:colors]
    end 
  }
end 

def team_names
  game_hash.map { |place, team| 
    team[:team_name]
  }
end 

def player_numbers(sought_team)
  numbers = []
   game_hash.each { |place, team| 
     if team[:team_name] == sought_team
       team.each { |attribute, data| 
       if attribute == :players
        data.each { |player| 
        numbers << player[:number]
        }
        end
        }
      end
       }
  return numbers
end 

def player_stats(players_name)
  result = {}
  game_hash.each { |place, team| 
   team.each { |attribute, data| 
     if attribute == :players
       data.each { |player| 
         if player[:player_name] == players_name
           result = player.delete_if { |key, value|
           key == :player_name
           }
         end
       }
     end 
   }
 }
 return result
end 

def big_shoe_rebounds
  biggest_shoe = 0 
  rebounds = 0 
  
  game_hash.each { |place, team| 
   team.each { |attribute, data| 
     if attribute == :players
       data.each { |player| 
         if player[:shoe] > biggest_shoe
           biggest_shoe = player[:shoe]
           rebounds = player[:rebounds]
         end
       }
     end 
   }
 }
 return rebounds
end 

def most_points_scored
  high_points = 0
  high_scorer = ""
  
  game_hash.each { |place, team| 
   team.each { |attribute, data| 
     if attribute == :players
       data.each { |player| 
         if player[:points] > high_points
           high_points = player[:points]
           high_scorer = player[:player_name]
         end
       }
     end 
   }
 }
  return high_scorer
end 

def winning_team 
  home_team = ""
  home_total_points = 0 
  
  away_team = ""
  away_total_points = 0 
  
  game_hash.each { |place, team|
    if place == :home
      home_team = team[:team_name]
      team.each { |attribute, data| 
      if attribute == :players
      data.each { |player| 
         home_total_points += player[:points]
      } 
      end 
     }
   else 
     away_team = team[:team_name]
     team.each { |attribute, data| 
     if attribute == :players
     data.each { |player| 
       away_total_points += player[:points]
     } 
     end 
     }
   end 
  }
  
  home_total_points > away_total_points ? home_team : away_team
end 

def player_with_longest_name
  longest_name = 0
  long_name = ""
  
  game_hash.each { |place, team| 
   team.each { |attribute, data| 
     if attribute == :players
       data.each { |player| 
         if player[:player_name].length > longest_name
           longest_name = player[:player_name].length
           long_name = player[:player_name]
         end
       }
     end 
   }
 }
  return long_name
end 

def most_steals
  high_steals = 0
  high_steal_name = ""
  
  game_hash.each { |place, team| 
   team.each { |attribute, data| 
     if attribute == :players
       data.each { |player| 
         if player[:steals] > high_steals
           high_steals = player[:steals]
           high_steal_name = player[:player_name]
         end
       }
     end 
   }
 }
  return high_steal_name
end 

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end 
