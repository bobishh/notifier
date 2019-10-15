class MessageTemplate < ApplicationRecord
  has_many :messages, dependent: :restrict_with_error
  scope :active, -> { where(archieved_at: nil) }

  INTERPOLATION_REGEXP = /%{([\w.0-9]+)}/

  class << self
    def allowed_for_interpolation
      @allowed_for_interpolation ||= User.attribute_names
        .map { |attr| "user.#{attr}" }
    end
  end

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true
  validate  :validate_body

  def archive
    update(archieved_at: Time.now)
  end

  private

  def validate_body
    errors.add(:body, :invalid) if invalid_values?
  end

  def invalid_values?
    !(body.scan(INTERPOLATION_REGEXP).flatten - self.class.allowed_for_interpolation).size.zero?
  end
end
