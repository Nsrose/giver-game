class CleanCharityAttributesInGiverGame < ActiveRecord::Migration
  def change
    remove_column :giving_games, :default_charity_a, :integer
    remove_column :giving_games, :default_charity_b, :integer
    remove_column :giving_games, :charityA_title, :integer
    remove_column :giving_games, :charityB_title, :integer
    remove_column :giving_games, :descriptionA, :integer
    remove_column :giving_games, :descriptionB, :integer

    add_column :giving_games, :charity_a_id, :integer
    add_column :giving_games, :charity_b_id, :integer
  end
end
