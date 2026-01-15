class AddFieldsToBeers < ActiveRecord::Migration[6.1]
  def change
    change_table :brewed_beers do |t|
      t.string  :beer_image
      t.string  :style
      t.string  :abv
      t.date    :date
      t.float   :rating
      t.boolean :favourite, default: false
      t.string  :location
    end

    change_table :tasted_beers do |t|
      t.string  :beer_image
      t.string  :style
      t.string  :abv
      t.date    :date
      t.float   :rating
      t.boolean :favourite, default: false
      t.string  :location
    end
  end
end
