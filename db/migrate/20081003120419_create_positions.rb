class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions, :force => true do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :positions
  end
end
