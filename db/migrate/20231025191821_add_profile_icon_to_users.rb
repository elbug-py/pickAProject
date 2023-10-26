class AddProfileIconToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_icon, :string
  end
end
