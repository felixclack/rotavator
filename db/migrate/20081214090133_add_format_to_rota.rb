class AddFormatToRota < ActiveRecord::Migration
  def self.up
    add_column :rotas, :format_id, :integer
    add_index :rotas, :format_id
  end

  def self.down
    remove_column :rotas, :format_id
  end
end
