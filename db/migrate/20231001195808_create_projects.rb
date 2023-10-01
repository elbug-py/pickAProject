class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :duration
      t.datetime :postulations_due_date
      t.boolean :is_payed
      t.string :amount
      t.integer :vacancies

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
