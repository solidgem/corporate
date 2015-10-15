class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :order_number
      t.string :service_kind_id
      t.date :date
      t.integer :counterparty_id
      t.integer :contact_person_id
      t.boolean :have_original

      t.timestamps null: false
    end
  end
end
