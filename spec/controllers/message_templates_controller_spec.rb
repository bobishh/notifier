require 'rails_helper'

RSpec.describe MessageTemplatesController, type: :controller do
  let(:valid_attributes) do
    { title: "Birthday",
      body: "Hello %{user.name}" }
  end

  let(:invalid_attributes) do
    { body: " " }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      MessageTemplate.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message_template = MessageTemplate.create! valid_attributes
      get :show, params: {id: message_template.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      message_template = MessageTemplate.create! valid_attributes
      get :edit, params: {id: message_template.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MessageTemplate" do
        expect {
          post :create, params: {message_template: valid_attributes}, session: valid_session
        }.to change(MessageTemplate, :count).by(1)
      end

      it "redirects to the created message_template" do
        post :create, params: {message_template: valid_attributes}, session: valid_session
        expect(response).to redirect_to(MessageTemplate.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {message_template: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested message_template" do
        message_template = MessageTemplate.create! valid_attributes
        put :update, params: {id: message_template.to_param, message_template: new_attributes}, session: valid_session
        message_template.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the message_template" do
        message_template = MessageTemplate.create! valid_attributes
        put :update, params: {id: message_template.to_param, message_template: valid_attributes}, session: valid_session
        expect(response).to redirect_to(message_template)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        message_template = MessageTemplate.create! valid_attributes
        put :update, params: {id: message_template.to_param, message_template: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested message_template" do
      message_template = MessageTemplate.create! valid_attributes
      expect {
        delete :destroy, params: {id: message_template.to_param}, session: valid_session
      }.to change(MessageTemplate, :count).by(-1)
    end

    it "redirects to the message_templates list" do
      message_template = MessageTemplate.create! valid_attributes
      delete :destroy, params: {id: message_template.to_param}, session: valid_session
      expect(response).to redirect_to(message_templates_url)
    end
  end
end
