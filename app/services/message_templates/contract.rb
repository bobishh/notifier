require "dry/validation"

module MessageTemplates
  # coerces and validates input params for message template
  class Contract < Dry::Validation::Contract
    config.messages.backend = :i18n
    INTERPOLATION_REGEX = /%{([\w.0-9]+)}/.freeze

    params do
      required(:body).filled(:string)
      required(:title).filled(:string)
    end

    rule(:body) do
      interpolated = value.scan(INTERPOLATION_REGEX).flatten.uniq

      unless (interpolated - MessageTemplate.allowed_for_interpolation).size.zero?
        key.failure(:disallowed_values)
      end
    end

    rule(:title) do
      key.failure(:too_short) if value.size < 4
      key.failure(:not_unique) if MessageTemplate.exists?(title: value)
    end
  end
end
