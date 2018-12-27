def game_hash
  game_hash = {
  :home => {:team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
              "Alan Anderson" => {:number => 0,
                                  :shoe => 16,
                                  :points => 22,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 3,
                                  :blocks => 1,
                                  :slam_dunks => 1},
              "Reggie Evans" => {:number => 30,
                                  :shoe => 14,
                                  :points => 12,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 12,
                                  :blocks => 12,
                                  :slam_dunks => 7},
              "Brook Lopez" => {:number => 11,
                                  :shoe => 17,
                                  :points => 17,
                                  :rebounds => 19,
                                  :assists => 10,
                                  :steals => 3,
                                  :blocks => 1,
                                  :slam_dunks => 15},
              "Mason Plumlee" => {:number => 1,
                                  :shoe => 19,
                                  :points => 26,
                                  :rebounds => 12,
                                  :assists => 6,
                                  :steals => 3,
                                  :blocks => 8,
                                  :slam_dunks => 5},
              "Jason Terry" => {:number => 31,
                                  :shoe => 15,
                                  :points => 19,
                                  :rebounds => 2,
                                  :assists => 2,
                                  :steals => 4,
                                  :blocks => 11,
                                  :slam_dunks => 1}
              }
            },
  :away => {:team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
              "Jeff Adrien" => {:number => 4,
                                  :shoe => 18,
                                  :points => 10,
                                  :rebounds => 1,
                                  :assists => 1,
                                  :steals => 2,
                                  :blocks => 7,
                                  :slam_dunks => 2},
              "Bismak Biyombo" => {:number => 0,
                                  :shoe => 16,
                                  :points => 12,
                                  :rebounds => 4,
                                  :assists => 7,
                                  :steals => 7,
                                  :blocks => 15,
                                  :slam_dunks => 10},
              "DeSagna Diop" => {:number => 2,
                                  :shoe => 14,
                                  :points => 24,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 4,
                                  :blocks => 5,
                                  :slam_dunks => 5},
              "Ben Gordon" => {:number => 8,
                                  :shoe => 15,
                                  :points => 33,
                                  :rebounds => 3,
                                  :assists => 2,
                                  :steals => 1,
                                  :blocks => 1,
                                  :slam_dunks => 0},
              "Brendan Haywood" => {:number => 33,
                                  :shoe => 15,
                                  :points => 6,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 22,
                                  :blocks => 5,
                                  :slam_dunks => 12}
            }
          }
  }
end

def num_points_scored(players_name)
  game_hash.each { |team_location, team_data|
    team_data.each { |attribute, data|
      if attribute == :players
        data.each { |player, stat|
          if player == players_name
            return stat[:points]
          end
        }
      end
    }
  }
end

def shoe_size(players_name)
  game_hash.each { |team_location, team_data|
    team_data.each { |attribute, data|
      if attribute == :players
        data.each { |player, stat|
          if player == players_name
            return stat[:shoe]
          end
        }
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each { |team_location, team_data|
    if team_name == game_hash[team_location][:team_name]
      return game_hash[team_location][:colors]
    end
  }
end

def team_names
  team_names = Array.new
  game_hash.each { |team_location, team_data|
    team_names << game_hash[team_location][:team_name]
  }
  team_names
end

def player_numbers(team_name)
  player_numbers = Array.new
  game_hash.each { |team_location, team_data|
    if team_name == team_data[:team_name]
    team_data[:players].each { |name, stats|
      player_numbers << stats[:number]
    }
    end
  }
  player_numbers
end

def player_stats(player_name)
  game_hash.each { |team_location, team_data|
    if team_data[:players].keys.include?(player_name)
      return team_data[:players][player_name]
    end
  }
end

def big_shoe_rebounds
  shoe_size = Array.new
  game_hash.each { |team_location, team_data|
    team_data[:players].each { |name, stats|
      shoe_size << stats[:shoe]
    }
  }
  rebounds = Array.new
  game_hash.each { |team_location, team_data|
    team_data[:players].each { |name, stats|
      rebounds << stats[:rebounds]
    }
  }
  max_size = 0
  index = 0
  shoe_size.each { |size|
    if max_size == 0
      max_size = size
    elsif max_size < size
      max_size = size
      index = shoe_size.index(size)
    end
  }
  rebounds[index]
end
