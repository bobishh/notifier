require 'rails_helper'

RSpec.describe "message_templates/new", type: :view do
  before(:each) do
    assign(:message_template, MessageTemplate.new(
      :body => "MyText",
      :title => "MyString"
    ))
  end

  it "renders new message_template form" do
    render

    assert_select "form[action=?][method=?]", message_templates_path, "post" do

      assert_select "textarea[name=?]", "message_template[body]"

      assert_select "input[name=?]", "message_template[title]"
    end
  end
end
