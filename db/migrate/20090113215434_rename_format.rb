class RenameFormat < ActiveRecord::Migration
  def self.up
    rename_table :formats, :rota_formats
    rename_table :formats_positions, :positions_rota_formats
    rename_column :positions_rota_formats, :format_id, :rota_format_id
  end

  def self.down
    rename_table :rota_formats, :formats
    rename_column :positions_rota_formats, :rota_format_id, :format_id
    rename_table :positions_rota_formats, :formats_positions
  end
end
