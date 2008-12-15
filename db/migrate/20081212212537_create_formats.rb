class CreateFormats < ActiveRecord::Migration
  def self.up
    create_table :formats do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :formats_positions, :id => false do |t|
      t.integer :format_id
      t.integer :position_id
    end
  end

  def self.down
    drop_table :formats
  end
end
