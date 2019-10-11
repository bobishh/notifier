class CreateMessageTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :message_templates do |t|
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
