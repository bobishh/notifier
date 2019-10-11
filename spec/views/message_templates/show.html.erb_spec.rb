require 'rails_helper'

RSpec.describe "message_templates/show", type: :view do
  before(:each) do
    @message_template = assign(:message_template, MessageTemplate.create!(
      :body => "MyText",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
  end
end
