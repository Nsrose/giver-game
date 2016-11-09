class ChangeGameIsPrivateToDefaultTrue < ActiveRecord::Migration
  def change
    change_column :giving_games, :is_private, :boolean, :default => true
  end
end
