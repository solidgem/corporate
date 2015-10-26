class AddTimestampsToContractAppendixes < ActiveRecord::Migration
  class ContractAppendix < ActiveRecord::Base
  end

  def up
    add_column :contract_appendixes, :created_at, :integer
    add_column :contract_appendixes, :updated_at, :integer

    ContractAppendix.update_all(created_at: DateTime.current, updated_at: DateTime.current)

    change_column_null :contract_appendixes, :created_at, false
    change_column_null :contract_appendixes, :updated_at, false
  end

  def down
    remove_column :contract_appendixes, :created_at, :integer
    remove_column :contract_appendixes, :updated_at, :integer
  end
end
