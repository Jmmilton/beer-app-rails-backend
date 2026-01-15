class AddNotesFieldToBeers < ActiveRecord::Migration[6.1]
  def change
    change_table :brewed_beers do |t|
      t.string  :brewing_notes
      t.date  :date_brewed
    end

    change_table :tasted_beers do |t|
      t.string  :tasting_notes
      t.date  :date_tasted
    end
  end
end
