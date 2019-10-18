class Event < ApplicationRecord
  belongs_to :message_template
  belongs_to :user
end
