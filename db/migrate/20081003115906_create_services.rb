class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services, :force => true do |t|
      t.datetime    :start_at
      t.belongs_to  :location
    end
  end

  def self.down
    drop_table :services
  end
end
