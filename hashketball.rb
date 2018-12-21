# Write your code here!

require "pry"

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets" ,
      :colors => ["Black", "White"] ,
      :players => {
        "Alan Anderson" => {
          :number => 0 ,
          :shoe => 16 ,
          :points => 22 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 3 ,
          :blocks => 1 ,
          :slam_dunks => 1
        } ,
        "Reggie Evans" => {
          :number => 30 ,
          :shoe => 14 ,
          :points => 12 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 12 ,
          :blocks => 12 ,
          :slam_dunks => 7
        } ,
        "Brook Lopez" => {
          :number => 11 ,
          :shoe => 17 ,
          :points => 17 ,
          :rebounds => 19 ,
          :assists => 10 ,
          :steals => 3 ,
          :blocks => 1 ,
          :slam_dunks => 15
        } ,
        "Mason Plumlee" => {
          :number => 1 ,
          :shoe => 19 ,
          :points => 26 ,
          :rebounds => 12 ,
          :assists => 6 ,
          :steals => 3 ,
          :blocks => 8 ,
          :slam_dunks => 5
        } ,
        "Jason Terry" => {
          :number => 31 ,
          :shoe => 15 ,
          :points => 19 ,
          :rebounds => 2 ,
          :assists => 2 ,
          :steals => 4 ,
          :blocks => 11 ,
          :slam_dunks => 1
        }
      }
    } ,
    :away => {
      :team_name => "Charlotte Hornets" ,
      :colors => ["Turquoise", "Purple"] ,
      :players => {
        "Jeff Adrien" => {
          :number => 4 ,
          :shoe => 18 ,
          :points => 10 ,
          :rebounds => 1 ,
          :assists => 1 ,
          :steals => 2 ,
          :blocks => 7 ,
          :slam_dunks => 2
        } ,
        "Bismak Biyombo" => {
          :number => 0 ,
          :shoe => 16 ,
          :points => 12 ,
          :rebounds => 4 ,
          :assists => 7 ,
          :steals => 7 ,
          :blocks => 15 ,
          :slam_dunks => 10
        } ,
        "DeSagna Diop" => {
          :number => 2 ,
          :shoe => 14 ,
          :points => 24 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 4 ,
          :blocks => 5 ,
          :slam_dunks => 5
        } ,
        "Ben Gordon" => {
          :number => 8 ,
          :shoe => 15 ,
          :points => 33 ,
          :rebounds => 3 ,
          :assists => 2 ,
          :steals => 1 ,
          :blocks => 1 ,
          :slam_dunks => 0
        } ,
        "Brendan Haywood" => {
          :number => 33 ,
          :shoe => 15 ,
          :points => 6 ,
          :rebounds => 12 ,
          :assists => 12 ,
          :steals => 22 ,
          :blocks => 5 ,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if player_name == player
            return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if player_name == player
            return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  name_array = []
  game_hash.each do |location, team_data|
    name_array << team_data[:team_name]
  end
  name_array
end

def player_numbers(team)
  number_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |guy, stats|
            stats.each do |stat_name, value|
              if stat_name == :number
                number_array << value
              end
            end
          end
        end
      end
    end
  end
  number_array
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if player_name == name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_player = nil
  largest_shoe_rebounds = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if not largest_shoe_player
            largest_shoe_player = player_name
            largest_shoe_rebounds = stats[:rebounds]
          else
            if shoe_size(player_name) > shoe_size(largest_shoe_player)
              largest_shoe_player = player_name
              largest_shoe_rebounds = stats[:rebounds]
            end
          end
        end
      end
    end
  end
  largest_shoe_rebounds
end

#bonus!
def most_points_scored
  highest_scoring_player = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if not highest_scoring_player
            highest_scoring_player = [player_name, stats[:points]]
          else
            if stats[:points] > highest_scoring_player[1]
              highest_scoring_player = [player_name, stats[:points]]
            end
          end
        end
      end
    end
  end
  puts "#{highest_scoring_player[0]} has the most points with #{highest_scoring_player[1]}."
  highest_scoring_player[0]
end

def winning_team
  nets = game_hash[:home][:players]
  hornets = game_hash[:away][:players]
  nets_score = 0
  hornets_score = 0
  nets.each do |player, stats|
    nets_score += stats[:points]
  end
  hornets.each do |player, stats|
    hornets_score += stats[:points]
  end
  if nets_score > hornets_score
    "The Nets win #{nets_score} to #{hornets_score}!"
  else
    "The Hornets win #{hornets_score} to #{nets_score}!"
  end
end

def player_with_longest_name
  longest_name = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if not longest_name
            longest_name = player_name
          else
            if player_name.length > longest_name.length
              longest_name = player_name
            end
          end
        end
      end
    end
  end
  longest_name
end

#super bonus!
def long_name_steals_a_ton?
  highest_steals_player = nil
  highest_steals_amount = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
           if not highest_steals_player
            highest_steals_player = player_name
            highest_steals_amount = stats[:steals]
          else
            if stats[:steals] > highest_steals_amount
              highest_steals_player = player_name
              highest_steals_amount = stats[:steals]
            end
          end
        end
      end
    end
  end
  if player_with_longest_name == highest_steals_player
    true
  else
    false
  end
end

#couldve used this
def get_stat_value_by_player(player, stat)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stats|
          if player_name == player
            return stats[stat]
          end
        end
      end
    end
  end
end
