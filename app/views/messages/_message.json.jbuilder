json.extract! message, :id, :user_id, :message_template_id, :scheduled_send_at, :sent_at, :created_at, :updated_at
json.url message_url(message, format: :json)
