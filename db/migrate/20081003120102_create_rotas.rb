class CreateRotas < ActiveRecord::Migration
  def self.up
    create_table :rotas, :force => true do |t|
      t.belongs_to :service
      t.belongs_to :team
      t.timestamps
    end
  end

  def self.down
    drop_table :rotas
  end
end
