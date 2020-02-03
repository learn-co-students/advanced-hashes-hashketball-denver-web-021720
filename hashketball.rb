require 'pp'
require 'pry'
def game_hash()
#will contain and return nested hashes
# Top Level has keys :home, :away
#The Values of home and away keys are hashes
#ho :home => {:team_name =>'team_name' ,:colors=>[colors] , :players => [{stats1},{stats2},ect.. ]}
#statsi = {:player_name, :number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks}
playersHome = {
  :player_name => ['Alan Anderson','Reggie Evans','Brook Lopez','Mason Plumlee','Jason Terry'],
  :number => [0,30,11,1,31],
  :shoe => [16,14,17,19,15] ,
  :points  => [22,12,17,26,19],
  :rebounds  => [12,12,19,11,2],
  :steals => [3,12,3,3,4],
  :assists => [12,12,10,6,2],
  :blocks => [1,12,1,8,11],
  :slam_dunks => [1,7,15,5,1]}

secondHashHome={:team_name =>'Brooklyn Nets' ,:colors=>['Black','White'] , :players => playersHome}

playersAway = {
  :player_name => ['Jeff Adrien','Bismack Biyombo','DeSagna Diop','Ben Gordon','Kemba Walker'],
  :number => [4,0,2,8,33],
  :shoe => [18,16,14,15,15] ,
  :points  => [10,12,24,33,6],
  :rebounds  => [1,4,12,3,12],
  :assists => [1,7,12,2,12],
  :steals => [2,22,4,1,7],
  :blocks => [7,15,5,1,5],
  :slam_dunks => [2,10,5,0,12]
}

secondHashAway={:team_name =>'Charlotte Hornets' ,:colors=>['Turquoise','Purple'] , :players => playersAway}
top_level = {:home => secondHashHome, :away => secondHashAway}
return top_level
end
def homeOrAway(player)
    data = game_hash()
    homeplayers = data[:home][:players][:player_name]
    awayplayers = data[:away][:players][:player_name]
    if homeplayers.index(player)
      return "home"
    end
    if awayplayers.index(player)
      return "away"
    else
      return "fuck"
    end
end
puts homeOrAway('Jeff Adrien')

def playerParamater(string,player)
  data = game_hash
  playersHome = data[:home][:players][:player_name]
  playersAway = data[:away][:players][:player_name]
  numbersHome = data[:home][:players][string.to_sym]
  numbersAway = data[:away][:players][string.to_sym]
  allPlayers = playersHome.concat(playersAway)
  allNumbers = numbersHome.concat(numbersAway)
  index = allPlayers.find_index(player)
  if index
    return allNumbers[index]
  else
    return 'not available'
  end
end

def num_points_scored(player)
  return playerParamater(:points,player)
end

def shoe_size(player)
  return playerParamater(:shoe,player)
end
def team_colors(team)
data = game_hash
  if team =="Brooklyn Nets"
    return data[:home][:colors]
  else
    return data[:away][:colors]
  end
end


def team_names(player)


end


def player_numbers(player)
  return playerParamater(:number,player)
end

def player_stats

end
