class AddPrivateFieldsToGame < ActiveRecord::Migration
  def change
    add_column :giving_games, :is_private, :boolean, :default => false
    add_column :giving_games, :resource_id, :string, :default => nil

  GivingGame.all.each do |game|
    if !(game.is_private?)
      game.resource_id = game.id
    end
  end
  end
end
