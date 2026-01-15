class AddTypeToTastedBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :tasted_beers, :beer_type, :string
  end
end
