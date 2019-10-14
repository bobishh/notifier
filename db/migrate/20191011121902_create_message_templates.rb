class CreateMessageTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :message_templates do |t|
      t.text :body, null: false
      t.string :title, null: false

      t.timestamps
    end

    add_index :message_templates, :title, unique: true
  end
end
