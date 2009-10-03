class Team < ActiveRecord::Base
  fields do
      name :string 
      year_start :integer, :default => 0
      year_end :integer, :default => 9999
  end
   
end
