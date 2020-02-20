require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },{
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },{
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17, 
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15,
      },{
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8, 
        :slam_dunks => 5
      },{
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },{
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },{
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },{
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
      ]
    }
  }
end

def players
  game_hash[:away][:players].concat(game_hash[:home][:players])
end

def find_player(name)
  players.find do |player|
    player[:player_name] == name
  end
end

def teams
  game_hash.values
end

def find_team(team_name)
  teams.find do |team|
    team[:team_name] == team_name
  end
end

def num_points_scored(name)
  find_player(name)[:points]
end

def shoe_size(name)
  find_player(name)[:shoe]
end

def team_colors(team_name)
  find_team(team_name)[:colors]
end

def team_names
  teams.map do |team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  find_team(team_name)[:players].map do |player|
    player[:number]
  end
end

def player_stats(name)
  find_player(name).reject do |key,value|
    key == :player_name
  end
end

def most_of(attribute)
  most = 0
  player_name = ""
  players.each do |player|
    if player[attribute].is_a? String
      if player[attribute].length >= most
        most = player[attribute].length
        player_name = player[:player_name]
      end
    elsif player[attribute] >= most
      most = player[attribute]
      player_name = player[:player_name]
    end
  end
  player_name
end

def big_shoe_rebounds
  find_player(most_of(:shoe))[:rebounds]
end

def most_points_scored
  most_of(:points)
end

def winning_team
  total_home_points = game_hash[:home][:players].reduce(0) do |total,player|
    total + player[:points]
  end
  total_away_points = game_hash[:away][:players].reduce(0) do |total,player|
    total + player[:points]
  end
  total_home_points > total_away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  most_of(:player_name)
end

def player_with_longest_name
  most_of(:player_name)
end

def long_name_steals_a_ton?
  player_with_longest_name == most_of(:steals) ? true : false
end


# def num_points_scored(player)
#   game_hash.each do |team,info|
#     info[:players].each_index do |player_index|
#       if info[:players][player_index][:player_name] == player
#         return info[:players][player_index][:points]
#       end
#     end
#   end
# end

# def shoe_size(player)
#   game_hash.each do |team,info|
#     info[:players].each_index do |player_index|
#       if info[:players][player_index][:player_name] == player
#         return info[:players][player_index][:shoe]
#       end
#     end
#   end
# end

# def team_colors(team_name)
#   game_hash.each do |team,info|
#     if info[:team_name] == team_name
#       return info[:colors]
#     end
#   end
# end

# def team_names
#   team_names = []
#   game_hash.each do |team,info|
#     team_names << info[:team_name]
#   end
#   team_names
# end

# def player_numbers(team_name)
#   jerseys = []
#   game_hash.each do |team,info|
#     if game_hash[team][:team_name] == team_name
#       players = game_hash[team][:players]
#       players.each_index do |player_index|
#       jerseys << players[player_index][:number]
#       end
#     end
#   end
#   jerseys
# end

# def player_stats(player)
#   player_stats = {}
#   game_hash.each do |team,info|
#     info[:players].each_index do |player_index|
#       if info[:players][player_index][:player_name] == player
#         info[:players][player_index].each do |stat,value|
#           if stat != :player_name
#           player_stats[stat] = info[:players][player_index][stat]
#           end
#         end
#       end
#     end
#   end
#   player_stats
# end

# def most_of(attribute)
#   most = 0
#   player_name = ""
#   game_hash.each do |team,info|
#     info[:players].each do |player|
#       if player[attribute].is_a? String
#         if player[attribute].length >= most
#           most = player[attribute].length
#           player_name = player[:player_name]
#         end
#       elsif player[attribute] >= most
#         most = player[attribute]
#         player_name = player[:player_name]
#       end
#     end
#   end
#   player_name
# end

# def big_shoe_rebounds
#   game_hash.each do |team, info|
#     info[:players].each do |player|
#       if player[:player_name] == most_of(:shoe)
#         return player[:rebounds]
#       end
#     end
#   end
# end

# # def big_shoe_rebounds
# #   largest_shoe = 0
# #   rebounds = 0
# #   game_hash.each do |team, info|
# #     team_players = game_hash[team][:players]
# #     team_players.each do |player|
# #       if player[:shoe] >= largest_shoe
# #         largest_shoe = player[:shoe]
# #         rebounds = player[:rebounds]
# #       end
# #     end 
# #   end
# #   rebounds
# # end

# def most_points_scored
#   most_of(:points)
# end

# # def most_points_scored
# #   most_points = 0
# #   most_scored = ""
# #   game_hash.each do |team,info|
# #     team_players = game_hash[team][:players]
# #     team_players.each do |player|
# #       if player[:points] >= most_points
# #         most_points = player[:points]
# #         most_scored = player[:player_name]
# #       end
# #     end
# #   end
# #   most_scored
# # end

# def winning_team
#   total_home_points = 0
#   total_away_points = 0
#   game_hash[:home][:players].each do |player|
#     total_home_points += player[:points]
#   end
#   game_hash[:away][:players].each do |player|
#     total_away_points += player[:points]
#   end
#   total_home_points > total_away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
# end


# def player_with_longest_name
#   most_of(:player_name)
# end

# # def player_with_longest_name
# #   longest_name = ""
# #   game_hash.each do |team, info|
# #     team_players = game_hash[team][:players]
# #     team_players.each do |player|
# #       if player[:player_name].length > longest_name.length
# #         longest_name = player[:player_name]
# #       end
# #     end
# #   end
# #   longest_name
# # end


# # def long_name_steals_a_ton?
# #   high_steals = 0
# #   most_steals = ""
# #   game_hash.each do |team, info|
# #     team_players = game_hash[team][:players]
# #     team_players.each do |player|
# #       if player[:steals] > high_steals
# #         high_steals = player[:steals]
# #         most_steals = player[:player_name]
# #       end
# #     end
# #   end
# #   player_with_longest_name == most_steals ? true : false
# # end

# def long_name_steals_a_ton?
#   player_with_longest_name == most_of(:steals) ? true : false
# end