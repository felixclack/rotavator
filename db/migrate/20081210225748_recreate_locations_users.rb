class RecreateLocationsUsers < ActiveRecord::Migration
  def self.up
    drop_table :locations_users
    create_table :locations_users, :id => false do |t|
      t.integer :location_id
      t.integer :user_id
    end
  end

  def self.down
  end
end
