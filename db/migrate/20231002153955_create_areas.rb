class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.integer :name

      t.timestamps
    end
  end
end
