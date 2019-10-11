require 'rails_helper'

RSpec.describe "MessageTemplates", type: :request do
  describe "GET /message_templates" do
    it "works! (now write some real specs)" do
      get message_templates_path
      expect(response).to have_http_status(200)
    end
  end
end
