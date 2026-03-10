class ChangeUserIdNullOnBeers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :beers, :user_id, false
  end
end
