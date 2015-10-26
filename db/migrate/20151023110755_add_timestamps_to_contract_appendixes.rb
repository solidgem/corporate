class AddTimestampsToContractAppendixes < ActiveRecord::Migration
  class ContractAppendix < ActiveRecord::Base
  end

  def up
    add_column :contract_appendixes, :created_at, :datetime
    add_column :contract_appendixes, :updated_at, :datetime

    ContractAppendix.update_all(created_at: DateTime.current, updated_at: DateTime.current)

    change_column_null :contract_appendixes, :created_at, false
    change_column_null :contract_appendixes, :updated_at, false
  end

  def down
    remove_column :contract_appendixes, :created_at, :datetime
    remove_column :contract_appendixes, :updated_at, :datetime
  end
end
