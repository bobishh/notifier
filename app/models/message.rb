class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_template

  validates :scheduled_send_at, presence: true

  def render_body
    MessageTemplate::Body.new(message_template.body).render_for(user)
  end
end
