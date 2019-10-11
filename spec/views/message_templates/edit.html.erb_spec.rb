require 'rails_helper'

RSpec.describe "message_templates/edit", type: :view do
  before(:each) do
    @message_template = assign(:message_template, MessageTemplate.create!(
      :body => "MyText",
      :title => "MyString"
    ))
  end

  it "renders the edit message_template form" do
    render

    assert_select "form[action=?][method=?]", message_template_path(@message_template), "post" do

      assert_select "textarea[name=?]", "message_template[body]"

      assert_select "input[name=?]", "message_template[title]"
    end
  end
end
