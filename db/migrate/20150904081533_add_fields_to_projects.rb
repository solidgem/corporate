class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :type, :string
    add_column :projects, :deadline, :datetime
    add_column :projects, :finish_date, :datetime
    add_column :projects, :complaints, :integer
    add_column :projects, :critical_complaints, :integer
    add_column :projects, :letters_of_thanks, :integer
    add_column :projects, :overdue_type, :string
  end
end
