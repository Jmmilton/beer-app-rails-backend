class AddUserIdToBeers < ActiveRecord::Migration[6.1]
  def change
    add_reference :beers, :user, null: true, foreign_key: true
  end
end
