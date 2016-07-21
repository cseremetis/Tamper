class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :game, index: true
      #score used to keep track of players' capabilities
      t.integer :score, default: 0
      t.string :name
      t.timestamps null: false
    end
  end
end
