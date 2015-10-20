class CreateActs < ActiveRecord::Migration
  def change
    create_table :contract_acts do |t|
      t.integer :order_number
      t.date :date
      t.string :formulation
      t.integer :document_id
      t.string :document_type
      t.integer :sum

      t.timestamps null: false
    end
  end
end
