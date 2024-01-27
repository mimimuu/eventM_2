class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :start_time,         null: false
      t.datetime :end_time,           null: false
      t.string   :place,              null: false
      t.string   :spot
      t.integer  :fee,                null: false
      t.string   :payer,              null: false
      t.string   :booker,             null: false
      t.string   :colum
      t.integer  :state_id,           null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
