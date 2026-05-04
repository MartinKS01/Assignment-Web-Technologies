class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_attendees
      t.integer :status

      t.references :category, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :organizer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end