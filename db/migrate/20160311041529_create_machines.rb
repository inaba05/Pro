class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.integer :number
      t.integer :model_id
      t.text :about
      t.date :from
      t.date :to

      t.timestamps null: false
    end
  end
end
