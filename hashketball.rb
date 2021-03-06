# Write your code here!
require 'pry'

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
            shoe: 15, #game_hash[:away][:players]["Ben Gordon"][:shoe]
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

def num_points_scored(player)
    game_hash.map do |location, team|
        team.map do |attribute, data|
            if data.include?(player)
            return game_hash[location][attribute][player][:points]
            end
        end 
    end  
end 

def shoe_size(player)
    game_hash.map do |location, team|
        team.map do |attribute, data|
            if data.include?(player)
            return game_hash[location][attribute][player][:shoe]
            end
        end 
    end  
end 


def team_colors(name)
    game_hash.map do |location, team_data|
        if team_data[:team_name] == name
            return team_data[:colors]
        end 
    end 
end 

def team_names
    game_hash.map do |location, team_data|
        team_data[:team_name]
    end
end

def player_numbers(team_name)
    array = []
    game_hash.map do |location, team|
        team.map do |attribute, data|
            if data.include?(team_name)
                team[:players].each do |name, stats|
                    stats.each do |k, v|
                        if k == :number
                            array << v
                        end
                    end 
                end 
            end 
        end 
    end 
    array
end 

def player_stats(player_name)
  var = ""
  game_hash.map do |location, team|
    team.map do |attribute, data|
      if data.include?(player_name)
        team[:players].map do |name, stats|
          if name == player_name
          var = stats
          #return stats
          #remember to try returning hashes without implicit returns!
          #UPDATE: did it!
          end
        end
      end
    end
  end
  var
end 

#game_hash[:away][:players]["Ben Gordon"][:shoe]
def big_shoe_rebounds_first_attempt
  big_foot = game_hash[:away][:players]["Ben Gordon"]
  game_hash.map do |location, team|
    team[:players].map do |name, player|
      if player[:shoe] > big_foot[:shoe]
        big_foot = player
      end
    end  
  end 
  big_foot[:rebounds] 
end 

def big_shoe_rebounds
  big_foot = nil
  game_hash.map do |location, team|
    team[:players].map do |name, player| 
      if big_foot.nil? || player[:shoe] > big_foot[:shoe]
        big_foot = player
      end
    end  
  end 
  big_foot[:rebounds] 
end