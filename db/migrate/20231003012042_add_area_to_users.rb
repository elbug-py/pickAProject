class AddAreaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :area, null: false, foreign_key: true
  end
end
