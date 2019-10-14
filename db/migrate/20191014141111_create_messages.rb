class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message_template, null: false, foreign_key: true
      t.datetime :scheduled_send_at, null: false
      t.datetime :sent_at

      t.timestamps
    end
  end
end
