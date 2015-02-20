class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.string :name
      t.integer :years_traveling
      t.integer :matches
      t.integer :ejections

      t.timestamps null: false
    end
  end
end
