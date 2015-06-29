class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :contacts, :text
    add_column :users, :requisites, :text
    add_column :users, :position, :string
  end
end
