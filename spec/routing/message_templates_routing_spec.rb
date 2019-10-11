require "rails_helper"

RSpec.describe MessageTemplatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/message_templates").to route_to("message_templates#index")
    end

    it "routes to #new" do
      expect(:get => "/message_templates/new").to route_to("message_templates#new")
    end

    it "routes to #show" do
      expect(:get => "/message_templates/1").to route_to("message_templates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/message_templates/1/edit").to route_to("message_templates#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/message_templates").to route_to("message_templates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/message_templates/1").to route_to("message_templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/message_templates/1").to route_to("message_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/message_templates/1").to route_to("message_templates#destroy", :id => "1")
    end
  end
end
