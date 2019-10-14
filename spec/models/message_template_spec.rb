require "rails_helper"

RSpec.describe MessageTemplate, type: :model do
  let(:body) { "Sample body" }
  let(:title) { "Sample title" }

  let(:attributes) do
    { body: body,
      title: title }
  end

  describe "#create" do
    context "title validations" do
      describe "short title" do
        let(:title) { "no" }

        it "won't create message template" do
          expect(described_class.create(attributes).persisted?).to be false
        end
      end
    end

    context "body validation" do
      describe "allowed interpolated values" do
        let(:body) { "Hello, %{user.name}!" }

        it "creates message template" do
          expect(described_class.create(attributes)).to be_a described_class
        end
      end

      describe "empty" do
        let(:body) { "" }

        it "won't create message template" do
          expect(described_class.create(attributes).persisted?).to be false
        end
      end

      describe "weird interpolated values in body" do
        let(:body) { "Hello %{admin.name}" }

        it "won't create message template" do
          expect(described_class.create(attributes).persisted?).to be false
        end

        it "adds :disallowed_values error to body" do
          new_template = described_class.create(attributes)
          expect(new_template.errors[:body]).not_to be_nil
        end
      end
    end
  end
end
