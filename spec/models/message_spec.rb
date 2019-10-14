require "rails_helper"

RSpec.describe Message, type: :model do
  let(:template_body) { "Hi, %{user.name}!" }
  let(:user) { User.create name: "Test User", email: "test.user@mail.com" }
  let(:message_template) { MessageTemplate.create title: "Sample template", body: template_body }

  subject { described_class.create(message_template: message_template, user: user) }

  describe "#render_body" do
    context "methods on a user" do
      it "returns a string with interpolated values" do
        expect(subject.render_body).to eq("Hi, Test User!")
      end
    end

    context "methods on user's association" do
      let(:template_body) { "Hi %{user.name}, your balance is %{user.balance}" }

      it "returns a string with values interpolated from an association" do
        expect(subject.render_body).to eq("Hi Test User, your balance is $100.00")
      end
    end
  end
end
