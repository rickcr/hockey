class Player < ActiveRecord::Base
  fields do
      first_name :string
      last_name :string
      inactive :boolean
      timestamps
  end
end
