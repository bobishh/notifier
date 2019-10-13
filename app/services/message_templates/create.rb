require "dry/monads"
require "dry/monads/do"

module MessageTemplates
  # service for message template creation
  class Create
    include Dry::Monads[:result]
    include Dry::Monads::Do.for(:call)

    ALLOWED_VALUES = MessageTemplate.allowed_for_interpolation

    def initialize(attributes)
      @attributes = attributes.to_h.symbolize_keys
    end

    def call
      validated        = yield validate_attributes
      message_template = yield create_message_template(validated.to_h)

      Success(message_template)
    end

    private

    def create_message_template(validated_attributes)
      Success(MessageTemplate.create(validated_attributes))
    end

    def validate_attributes
      MessageTemplates::Contract.new.call(@attributes)
    end
  end
end
