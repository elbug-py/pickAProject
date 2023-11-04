class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title,               null: false, default: ""
      t.string :description,               null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :inscription, null: true, foreign_key: true

      t.timestamps
    end
  end
end
