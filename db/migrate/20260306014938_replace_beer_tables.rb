class ReplaceBeerTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :tasted_beers
    drop_table :brewed_beers

    create_table :beers do |t|
      t.string "name", null: false
      t.text "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "beer_type", null: false
      t.string "beer_image"
      t.string "style", null: false
      t.string "abv", null: false
      t.float "rating"
      t.boolean "favourite", default: false
      t.string "location"
      t.string "brewing_notes"
      t.string "tasting_notes"
      t.date "date_brewed"
      t.date "date_tasted"
    end
  end
end