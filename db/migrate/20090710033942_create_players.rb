class CreatePlayers < ActiveRecord::Migration
  def self.up
    Player.create(:first_name => "Rick", :last_name => "Reumann").save!
    Player.create(:first_name => "Steve", :last_name => "Lavdas").save!
  end
 
end
