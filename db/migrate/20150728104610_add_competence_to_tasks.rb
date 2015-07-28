class AddCompetenceToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :competence, :string
  end
end
