class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :teams, :year_start, :integer, :default => 0
    add_column :teams, :year_end, :integer, :default => 9999
  end

  def self.down
    remove_column :teams, :year_start
    remove_column :teams, :year_end
  end
end
