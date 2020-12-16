class AddCityAndStateToVenue < ActiveRecord::Migration[6.0]

  def change
    add_column :venues, :city, :string
    add_column :venues, :state, :string
  end
  
end
