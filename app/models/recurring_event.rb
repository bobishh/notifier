class RecurringEvent < ApplicationRecord
  belongs_to :message_template
  belongs_to :user
end
