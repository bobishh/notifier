require "rails_helper"

RSpec.describe Message, type: :model do
  let(:template_body) { "Hi, %{user.name}!" }
  let(:user) { User.create name: "Test User", email: "test.user@mail.com" }
  let(:message_template) { MessageTemplate.create title: "Sample template", body: template_body }

  subject { described_class.create(message_template: message_template, user: user) }

  describe "#create" do
    context "methods on a user" do
      it "stores interpolated body in a field" do
        expect(subject.body).to eq("Hi, Test User!")
      end
    end

    context "methods on user's association" do
      before do
        Account.create user: user, balance: 1000.00, provider: :stripe
      end

      let(:template_body) { "Hi %{user.name}, you're using %{user.account.provider} and your account balance is $%{user.account.balance}" }

      it "returns a string with values interpolated from an association" do
        expect(subject.body).to eq("Hi Test User, you're using stripe and your account balance is $1000.0")
      end
    end
  end
end
