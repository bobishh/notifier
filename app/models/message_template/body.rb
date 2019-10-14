class MessageTemplate < ApplicationRecord
  # value object for message template body
  class Body
    attr_reader :attributes
    def initialize(string)
      @attributes = string.scan(::MessageTemplate::INTERPOLATION_REGEXP).flatten.uniq
      @body = string
    end

    def render_for(user)
      @body % build_data_hash(user)
    end

    private

    def build_data_hash(user)
      @attributes.each_with_object({}) do |attribute, acc|
        acc[attribute.to_sym] = infer_data(attribute, user)
      end
    end

    def infer_data(attribute, user)
      (attribute.split(".") - ["user"]).reduce(user) do |acc, method|
        acc = acc.public_send(method)
        acc
      end
    end
  end
end
