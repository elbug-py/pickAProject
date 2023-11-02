class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :duration
      t.datetime :postulations_due_date
      t.boolean :is_payed
      t.string :amount
      t.integer :vacancies
      t.integer :status, default: 1 #open

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
