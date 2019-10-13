require "rails_helper"

RSpec.describe MessageTemplates::Update do
  subject { described_class.new(message_template, updated_attributes).call }
  let(:message_template) { MessageTemplate.create(title: "sample title", body: "sample body") }

  let(:new_body) { "Hello %{user.name}!" }
  let(:new_title) { "Welcome template" }

  let(:updated_attributes) do
    { body: new_body,
      title: new_title }
  end

  context "invalid attributes" do
    let(:new_body) { "Hello %{weird.stuff}" }

    it "is failure" do
      expect(subject).to be_failure
    end
  end

  context "valid attributes" do
    it "is success" do
      expect(subject).to be_success
    end

    it "updates message template" do
      expect(subject.success.title).to eq(new_title)
    end
  end
end
