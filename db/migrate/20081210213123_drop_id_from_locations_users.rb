class DropIdFromLocationsUsers < ActiveRecord::Migration
  def self.up
    remove_column :locations_users, :id
  end

  def self.down
  end
end
