class AddTypeToBrewedBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :brewed_beers, :beer_type, :string
  end
end
