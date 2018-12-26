require "pry"

def game_hash
    {
    home: {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: {
            "Alan Anderson" => {
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1
                },
            "Reggie Evans" => {
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
                },
            "Brook Lopez" => {
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
                },
            "Mason Plumlee" => {
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
                },
            "Jason Terry" => {
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
                }
            }
        },
        
    away: {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: {
            "Jeff Adrien" => {
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
                },
            "Bismak Biyombo" => {
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 7,
                blocks: 15,
                slam_dunks: 10
                },
            "DeSagna Diop" => {
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
                },
            "Ben Gordon" => {
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
                },
            "Brendan Haywood" => {
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 22,
                blocks: 5,
                slam_dunks: 12
                }
            }
        }
        
        }
end

#def good_practices
#  game_hash.each do |location, team_data|
#    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#    binding.pry
#      team_data.each do |attribute, data|
#        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#        binding.pry
# 
#        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#        data.each do |data_item|
#            binding.pry
#      end
#    end
#  end
#end
#
#good_practices

#def num_points_scored(name)
##    points = ""
#    game_hash.each do |team, info_t|
##        binding.pry
#        info_t.each do |attribute, value|
##            binding.pry
#                if value.is_a?(Hash)
#                value.each do |player, info_p|
#                    if player == name
#                        info_p.each do |att, value|
#                            if att == :points
#                                value.to_i
#                            else
#                            end
#                        end
#                    else
#                    end
#                end
#            else
#            end
#        end
#    end
#
##    points
#end

def num_points_scored(name)
    result = ""
    game_hash.each do |location, team_data|
        team_data[:players].each do |p_name, data|
            if p_name == name
                result = data[:points]
            end
        end
    end
    result
end

def shoe_size(name)
    result = ""
    game_hash.each do |location, team_data|
        team_data[:players].each do |p_name, data|
            if p_name == name
                result = data[:shoe]
            end
        end
    end
    result
end

def team_colors(team_name)
    output = []
   game_hash.each do |location, team_data|
       if team_data[:team_name] == team_name
          output = team_data[:colors] 
       end
   end
    output
end

def team_names
    names = []
    game_hash.each do |location, team_data|
      names << team_data[:team_name]
   end
    names
end

def player_numbers(team)
    all_play_num = []
    game_hash.each do |location, team_data|
        if team_data[:team_name] == team
           team_data[:players].each do |name, stats|
               stats.each do |attribute, value|
                   if attribute == :number
                       all_play_num << value
                   end
               end
           end
        end
    end
    all_play_num
end

def player_stats(name)
    stats_p = {}
   game_hash.each do |location, team_data|
      team_data[:players].each do |player, stats|
          if player == name
              stats_p = stats
          end
      end
   end
    stats_p
end

def big_shoe_rebounds
    all_play_shoe = []
    game_hash.each do |location, team_data|
        team_data[:players].each do |player, stats|
            all_play_shoe << stats[:shoe] 
        end
    end
    
    all_play_shoe.sort!
    big_shoe = all_play_shoe.pop
    rebounds = 0
    
    game_hash.each do |location, team_data|
         team_data[:players].each do |player, stats|
            if stats[:shoe] == big_shoe
             rebounds = stats[:rebounds]
            end
         end
    end
    rebounds
end