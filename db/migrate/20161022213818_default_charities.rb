class DefaultCharities < ActiveRecord::Migration
  def change
    #Create the charities table
    create_table :charities do |t|
      t.string :name
      t.string :ein
      t.string :image
      t.text :description
      #belongs_to :charity_a, :class_name => "GivingGame", :foreign_key => :charity_a_id
      #belongs_to :charity_b, :class_name => "GivingGame", :foreign_key => :charity_b_id
    end
    #has_one :charity_a, :class_name => 'Charity', :foreign_key => :charity_a_id
    #has_one :charity_b, :class_name => 'Charity', :foreign_key => :charity_b_id
    #Add the foreign keys for charities A and B to the giving_game
    add_foreign_key :giving_game, :charities, column: :charity_a_id
    add_foreign_key :giving_game, :charities, column: :charity_b_id
  end
end
