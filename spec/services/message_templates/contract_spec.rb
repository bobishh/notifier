require "rails_helper"

RSpec.describe MessageTemplates::Contract do
  let(:body) { "Message template body" }
  let(:title) { "Sample Message template" }

  let(:params) do
    { body: body,
      title: title }
  end

  subject { described_class.new.call(params) }

  context "body validations" do
    describe "not allowed values" do
      let(:body) { "%{weird.stuff}"}

      it "is failure" do
        expect(subject).to be_failure
      end

      it "returns disallowed values error" do
        expect(subject.errors.map(&:text)).to eq(['contains values not allowed for interpolation'])
      end
    end

    describe "allowed values" do
      it "is success" do
        expect(subject).to be_success
      end
    end
  end

  context "title validations" do
    before do
      MessageTemplate.create(title: title, body: body)
    end

    describe "uniqueness" do
      it "is failure when message template with such a body exists" do
        expect(subject).to be_failure
      end

      it "returns uniqueness error" do
        expect(subject.errors.map(&:text)).to eq(["is not unique"])
      end
    end
  end
end
