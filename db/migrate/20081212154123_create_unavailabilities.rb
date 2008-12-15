class CreateUnavailabilities < ActiveRecord::Migration
  def self.up
    create_table :unavailabilities do |t|
      t.datetime    :from
      t.datetime    :to
      t.belongs_to  :user
      t.timestamps
    end
  end

  def self.down
    drop_table :unavailabilities
  end
end
