class RemoveBeerImageFromBeers < ActiveRecord::Migration[6.1]
  def change
    remove_column :beers, :beer_image, :string
  end
end
