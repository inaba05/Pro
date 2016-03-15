class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :machine_id
      t.date :date
      t.integer :big
      t.integer :reg
      t.integer :art
      t.integer :roll
      t.integer :final_roll
      t.integer :dry
      t.integer :result
      t.integer :sweet

      t.timestamps null: false
    end
  end
end
