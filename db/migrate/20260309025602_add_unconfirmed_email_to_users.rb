class AddUnconfirmedEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :unconfirmed_email, :string unless column_exists?(:users, :unconfirmed_email)
  end
end