class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_template
  before_save :set_body

  validates :scheduled_send_at, presence: true
  validate :data_can_be_rendered

  private

  def set_body
    self.body = ::MessageTemplate::Body.new(message_template.body).render_for(user)
  end

  def data_can_be_rendered
    ::MessageTemplate::Body.new(message_template.body).render_for(user)
    true
  rescue StandardError
    errors.add :message_template, :not_applicable
    false
  end
end
