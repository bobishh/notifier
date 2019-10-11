require 'rails_helper'

RSpec.describe "message_templates/index", type: :view do
  before(:each) do
    assign(:message_templates, [
      MessageTemplate.create!(
        :body => "MyText",
        :title => "Title"
      ),
      MessageTemplate.create!(
        :body => "MyText",
        :title => "Title"
      )
    ])
  end

  it "renders a list of message_templates" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
