class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :name
      t.string :position
      t.string :contacts

      t.timestamps null: false
    end
  end
end
