class CreateFormulas < ActiveRecord::Migration
  def change
    create_table :formulas do |t|
      t.integer :model_id
      t.integer :criteria
      t.integer :big
      t.integer :reg
      t.integer :roll

      t.timestamps null: false
    end
  end
end
