class ChangeUserIdNullOnBeers < ActiveRecord::Migration[6.1]
  def change
    Beer.where(user_id: nil).delete_all
    change_column_null :beers, :user_id, false
  end
end