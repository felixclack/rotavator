class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :positions_users, :force => true do |t|
      t.integer :position_id
      t.integer :user_id
    end
    
    create_table :locations_users, :force => true do |t|
      t.integer :location_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :positions_users
    drop_table :locations_users
  end
end
