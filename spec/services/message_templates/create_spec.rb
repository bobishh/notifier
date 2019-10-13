require "rails_helper"

RSpec.describe MessageTemplates::Create do
  subject { described_class.new(attributes).call }

  context "valid attributes" do
    let(:attributes) do
      { body: "Valid body for a template. %{user.name}",
        title: "Sample message template" }
    end

    it "returns success" do
      expect(subject).to be_success
    end

    it "returns message template inside a monad" do
      expect(subject.success).to be_a(MessageTemplate)
    end
  end

  context "invalid attributes" do
    let(:attributes) do
      { body: "Valid body for a template. %{weird_object.wrong_method}",
        title: "Sample wrong message template" }
    end

    it "returns failure" do
      expect(subject).to be_failure
    end
  end
end
