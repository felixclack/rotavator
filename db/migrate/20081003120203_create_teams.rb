class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams, :force => true do |t|
      t.string :name
      t.string :basecamp_name
    end
  end

  def self.down
    drop_table :teams
  end
end
