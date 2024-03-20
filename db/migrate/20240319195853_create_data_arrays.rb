class CreateDataArrays < ActiveRecord::Migration[7.1]
  def change
    create_table :data_arrays do |t|
      t.integer :amount
      t.jsonb :data, default: []
      t.timestamps
    end
  end
end
