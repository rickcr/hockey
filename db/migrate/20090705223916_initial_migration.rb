class InitialMigration < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string   :first_name
      t.string   :last_name
      t.boolean  :inactive
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :teams do |t|
      t.string :name
    end
    
    create_table :playergames do |t|
      t.boolean  :home
      t.integer  :score
      t.integer  :shots
      t.integer  :hits
      t.integer  :face_offs
      t.integer  :time_on_attack
      t.integer  :penalty_minutes
      t.integer  :power_play_goals
      t.integer  :power_plays
      t.integer  :short_handed_goals
      t.integer  :empty_net_goals
      t.string   :notes
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :match_id
      t.integer  :player_id
      t.integer  :team_id
    end
    
    create_table :matches do |t|
      t.datetime :match_date
      t.boolean  :overtime, :default => false
      t.boolean  :shootout, :default => false
      t.boolean  :linechanges, :default => false
      t.integer  :period_length
      t.string   :game_version
    end
  end

  def self.down
    drop_table :players
    drop_table :teams
    drop_table :playergames
    drop_table :matches
  end
end
