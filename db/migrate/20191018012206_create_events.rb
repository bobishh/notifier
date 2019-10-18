class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.title
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.references :message_template, null: false, foreign_key: true

      t.timestamps
    end

    create_table :recurring_events do |t|
      t.title
      t.integer :day
      t.integer :month
      t.references :user, null: false, foreign_key: true
      t.references :message_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
