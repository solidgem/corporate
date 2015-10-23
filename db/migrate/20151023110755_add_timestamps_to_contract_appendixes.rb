class AddTimestampsToContractAppendixes < ActiveRecord::Migration
  class Contract::Appendix < ActiveRecord::Base
  end

  def up
    add_timestamps(:contract_appendixes)
    Contract::Appendix.update_all(created_at: DateTime.current, updated_at: DateTime.current)
  end

  def down
    remove_timestamps(:contract_appendixes)
  end
end
