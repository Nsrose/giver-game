class AddDefaultCharitiesToGiverGames < ActiveRecord::Migration
  def change
    add_column :giving_games, :default_charity_a, :integer
    add_column :giving_games, :default_charity_b, :integer
  end
end
