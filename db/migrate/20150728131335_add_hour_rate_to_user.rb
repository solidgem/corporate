class AddHourRateToUser < ActiveRecord::Migration
  def change
    add_column :users, :hour_rate, :integer, default: 0
    add_column :users, :external_hour_rate, :integer, default: 0
  end
end
