class MessageBuilderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # consider as pseudocode
    tomorrow = 1.day.from_now
    RecurringEvent.where(day: tomorrow.day, month: tomorrow.month).find_in_batches do |events|
      process_batch(events)
    end

    Event.where(date: tomorrow.to_date).find_in_batches do |batch|
      process_batch(events)
    end
  end

  def process_batch(events)
    batch.map do |event|
      create_message(event)
    end
  end

  def create_message(event)
    Message.create(message_template_id: event.message_template_id,
                   user_id: event.user_id,
                   scheduled_send_at: 1.day.from_now)
  end
end
