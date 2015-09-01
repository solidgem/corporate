class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :title
      t.string :requisites
      t.string :contacts
      t.string :agreements
      t.string :site
      t.string :comment

      t.timestamps null: false
    end
  end
end
