class CreateAppendix < ActiveRecord::Migration
  def change
    create_table :contract_appendixes do |t|
      t.integer :order_number
      t.integer :contract_id
      t.date :date
      t.integer :contact_person_id
      t.boolean :have_original
    end
  end
end
