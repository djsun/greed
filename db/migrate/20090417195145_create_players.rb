class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :type
      t.string :name
      t.integer :game_id
      t.integer :score, :default => 0
      t.string :strategy

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
