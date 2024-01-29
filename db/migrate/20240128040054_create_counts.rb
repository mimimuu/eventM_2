class CreateCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :counts do |t|
      t.integer :attendance
      t.integer :absence
      t.integer :undecided
      t.references :event,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
