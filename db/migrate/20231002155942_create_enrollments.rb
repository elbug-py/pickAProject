class CreateEnrollments < ActiveRecord::Migration[7.0]
    def change
      create_table :enrollments do |t|
        t.integer :status
  
        t.references :user, null: false, foreign_key: true
        t.references :project, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end
  