require 'pry'
def game_hash
     return {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {
          "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          "Reggie Evans" => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          "Brook Lopez" => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          "Jason Terry" => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
        }
    },
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
          "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          "Bismak Biyombo" => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 7,
            :blocks => 15,
            :slam_dunks => 10
          },
          "DeSagna Diop" => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          "Ben Gordon" => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          "Brendan Haywood" => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 22,
            :blocks => 5,
            :slam_dunks => 12
          }
        }
      }
    }
end

def num_points_scored(player_name)
  game_hash.values.each do |team|
    if team[:players].key?(player_name)
      return team[:players][player_name][:points]
    end
  end
end

def shoe_size(player_name)
  game_hash.values.each do |team|
    if team[:players].key?(player_name)
      return team[:players][player_name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.values.each do |team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.values.each do |team|
    names << team[:team_name]
  end
  return names
end

def player_numbers(team_name)
  game_hash.values.each do |team|
    if team[:team_name] == team_name
      return team[:players].values.map { |x| x[:number] }
    end
  end
end

def player_stats(player_name)
  game_hash.values.each do |team|
    team[:players].each do |player, stats|
      if player == player_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  player_max_stats = {:shoe => 0}
  game_hash.values.each do |team|
    team[:players].each do |player_name, stats|
      if stats[:shoe] > player_max_stats[:shoe]
        player_max_stats = stats
      end
    end
  end
  return player_max_stats[:rebounds]
end

def most_points_scored
  most_points = 0
  player_most_points = nil
  game_hash.values.each do |team|
    team[:players].each do |player_name, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player_most_points = player_name
      end
    end
  end
  return player_most_points
end

def winning_team
  most_points = 0
  team_name = nil
  game_hash.values.each do |team|
    team_points = 0
    team[:players].values.each do |stats|
      team_points += stats[:points]
    end
    if team_points > most_points
      most_points = team_points
      team_name = team[:team_name]
    end
  end
  return team_name
end

def player_with_longest_name
  longest_name = ""
  game_hash.values.each do |team|
    team[:players].keys.each do |player_name|
      if player_name.length > longest_name.length
        longest_name = player_name
      end
    end
  end
  return longest_name
end

def player_with_most_steals
  most_steals = 0
  player_most_steals = nil
  game_hash.values.each do |team|
    team[:players].each do |player_name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        player_most_steals = player_name
      end
    end
  end
  return player_most_steals
end

def long_name_steals_a_ton?
  return player_with_longest_name == player_with_most_steals
end
