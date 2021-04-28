class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.belongs_to :event, null: false, foreign_key: true, default: 0
      t.belongs_to :user, null: false, foreign_key: true, default: 0
      t.text :note

      t.timestamps
    end
  end
end
