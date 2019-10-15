class AddArchievedAtToMessageTemplates < ActiveRecord::Migration[6.0]
  def change
    add_column :message_templates, :archieved_at, :datetime
  end
end
