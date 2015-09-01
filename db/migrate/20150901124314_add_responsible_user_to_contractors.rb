class AddResponsibleUserToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :responsible_user_id, :integer
  end
end
