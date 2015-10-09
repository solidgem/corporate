class CreateServiceKinds < ActiveRecord::Migration
  def change
    create_table :service_kinds do |t|
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
