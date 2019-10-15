class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_template
  after_validation :set_body

  validates :scheduled_send_at, presence: true

  def set_body
    self.body = ::MessageTemplate::Body.new(message_template.body).render_for(user)
  end
end
