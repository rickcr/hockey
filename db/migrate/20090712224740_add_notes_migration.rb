class AddNotesMigration < ActiveRecord::Migration
  def self.up
    add_column :matches, :notes, :string
  end

  def self.down
    remove_column :matches, :notes
  end
end
