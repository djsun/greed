class CreateTurns < ActiveRecord::Migration
  def self.up
    create_table :turns do |t|
      t.integer :player_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :turns
  end
end
