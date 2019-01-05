require 'pry'


def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe:16,
          points:22,
          rebounds:12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1},
          
          "Reggie Evans" => {
          number: 30,
          shoe:14,
          points:12,
          rebounds:12,
          assists:12,
          steals:12,
          blocks:12,
          slam_dunks:7},
          
          "Brook Lopez" => {
          number: 11,
          shoe:17,
          points:17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15},
          
          "Mason Plumlee" => {
          number: 1,
          shoe:19,
          points:26,
          rebounds:12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5},
          
          "Jason Terry" => {
          number: 31,
          shoe:15,
          points:19,
          rebounds:2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1},
      }
    },
  
   away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe:18,
          points:10,
          rebounds:1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2},
          
          "Bismak Biyombo" => {
          number: 0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:7,
          blocks:15,
          slam_dunks:10},
          
          "DeSagna Diop" => {
          number: 2,
          shoe:14,
          points:24,
          rebounds:12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5},
          
          "Ben Gordon" => {
          number: 8,
          shoe:15,
          points:33,
          rebounds:3,
          assists:2,
          steals:1,
          blocks:1,
          slam_dunks:0},
          
          "Brendan Haywood" => {
          number: 33,
          shoe:15,
          points:6,
          rebounds:12,
          assists:12,
          steals:22,
          blocks:5,
          slam_dunks:12},
      }
    }
  }
end

def num_points_scored(player_id)
  game_hash.each {|location, team_data|
  
  team_data[:players].each {|name, stats|
  
  if name == player_id
    return stats[:points]
  end
}
}
end

def shoe_size(player_id)
  game_hash.each {|location, team_data|
  team_data[:players].each {|name, stats|
  if name == player_id
    return stats[:shoe]
  end
  }
  }
end

def team_colors(team_id)
  game_hash.each {|location, team_data|
  if team_data[:team_name] == team_id
    return team_data[:colors]
  end
  }
end

def team_names
  team_names_array = []
  game_hash.each {|location, team_data|
  team_names_array << team_data[:team_name]
  }
  team_names_array
end

def player_numbers(team_id)
  numbers_array = []
  game_hash.each {|location, team_data|
  if team_data[:team_name] == team_id
  team_data[:players].each {|player, stats| numbers_array << stats[:number]
  }
  return numbers_array
end
  } 
end

def player_stats(player_id)
  game_hash.each {|location, team_data|
  team_data[:players].each {|player, stats|
  if player == player_id
    return stats
  end
  }
  }
end

def big_shoe_rebounds
  largest = 0 
  rebounds = 0
  game_hash.each {|loctaion, team_data|
  team_data[:players].each {|player, stats|
  if stats[:shoe] > largest
    largest = stats[:shoe]
    rebounds = stats[:rebounds]
  end
  }
  }
  rebounds
end

def most_points_scored
  most_points = 0 
  high_scorer = nil
  game_hash.each {|location, team_data|
  team_data[:players].each {|name, stats|
  if stats[:points] > most_points
    most_points = stats[:points]
    high_scorer = name
  end 
  }
  }
  high_scorer
end

def winning_team 
  home_points = 0
  away_points = 0 
  winning_team = nil
game_hash.each {|location, team_data|
if location === :home
team_data[:players].each {|name, stats|
home_points += stats[:points]}
else 
  team_data[:players].each {|name, stats|
away_points += stats[:points]}
end
}
if home_points > away_points 
  game_hash[:home][:team_name]
  elsif home_points < away_points
  game_hash[:away][:team_name]
else 
   puts "its a tie"
 end
end
  
  
def player_with_longest_name
  long_name_length = 0 
  longest_name = nil
  game_hash.each {|location, team_data|
  team_data[:players].each {|name, stats|
  if name.length > long_name_length
    long_name_length = name.length
    longest_name = name
  end 
  }
  }
 longest_name
end
  
  
  
  
  


  
  
  
