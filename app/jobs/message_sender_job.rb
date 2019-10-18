class MessageSenderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Message.where("scheduled_send_at > ?", 2.minutes.from_now).send
  end
end
