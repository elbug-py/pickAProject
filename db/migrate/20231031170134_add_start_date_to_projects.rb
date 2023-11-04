class AddStartDateToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :start_date, :date, null: false, default: Date.today
  end
end
