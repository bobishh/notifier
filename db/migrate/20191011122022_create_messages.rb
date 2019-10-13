class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :message_template, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamp :scheduled_send_at
      t.timestamp :sent_at

      t.timestamps
    end
  end
end
