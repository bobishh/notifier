class MessageTemplate < ApplicationRecord
  class << self
    def allowed_for_interpolation
      @allowed_for_interpolation ||= User.attribute_names.map do |attribute|
        "user.#{attribute}"
      end
    end
  end
end
