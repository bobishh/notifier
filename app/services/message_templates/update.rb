require "dry/monads"
require "dry/monads/do"

module MessageTemplates
  # service for message template creation
  class Update
    include Dry::Monads[:result]
    include Dry::Monads::Do.for(:call)

    ALLOWED_VALUES = MessageTemplate.allowed_for_interpolation

    def initialize(message_template, attributes)
      @message_template = message_template
      @attributes = attributes.to_h.symbolize_keys
    end

    def call
      validated_attributes = yield validate_attributes
      message_template     = yield update_message_template(validated_attributes.to_h)

      Success(message_template)
    end

    private

    def update_message_template(validated_attributes)
      @message_template.update!(validated_attributes)
      Success(@message_template)
    end

    def validate_attributes
      MessageTemplates::Contract.new.call(@attributes)
    end
  end
end
