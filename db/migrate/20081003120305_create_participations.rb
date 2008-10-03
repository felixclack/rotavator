class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations, :force => true do |t|
      t.string      :state
      t.belongs_to  :user
      t.belongs_to  :rota
      t.belongs_to  :position
      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
