class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :host
      t.string :location
      t.datetime :time
      t.text :description
      t.integer :register
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
