class Charity < ActiveRecord::Migration
  def change
    create_table(:charities) do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.string :ein, null: false, default: ""
      t.string :image_link
      t.string :homepage_link, null: false, default: ""
      t.string :donation_link, null: false, default: ""
    end
  end
end
