class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations, :force => true do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :locations
  end
end
