class RecreatePositionsUsers < ActiveRecord::Migration
  def self.up
    drop_table :positions_users
    create_table :positions_users, :id => false do |t|
      t.integer :position_id
      t.integer :user_id
    end
  end

  def self.down
  end
end
