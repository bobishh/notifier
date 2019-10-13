class CreateMessageTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :message_templates do |t|
      t.text :body, null: false
      t.string :title, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
