class AddPrivateFieldsToGame < ActiveRecord::Migration
  def change
    add_column :giving_games, :is_private, :boolean, :default => false
    add_column :giving_games, :private_id, :string, :default => nil
  end
end