class CreateFaces < ActiveRecord::Migration
  def self.up
    create_table :faces do |t|
      t.integer :value
      t.integer :roll_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :faces
  end
end
