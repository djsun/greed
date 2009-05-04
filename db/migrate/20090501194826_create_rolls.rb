class CreateRolls < ActiveRecord::Migration
  def self.up
    create_table :rolls do |t|
      t.integer :score, :default => 0, :null => false
      t.integer :accumulated_score, :default => 0, :null => false
      t.integer :unused, :default => 0, :null => false
      t.string :action_name
      t.integer :turn_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :rolls
  end
end
