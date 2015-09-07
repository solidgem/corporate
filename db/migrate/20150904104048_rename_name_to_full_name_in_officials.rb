class RenameNameToFullNameInOfficials < ActiveRecord::Migration
  def self.up
    rename_column :counterparty_officials, :name, :full_name
  end

  def self.down
  end
end
