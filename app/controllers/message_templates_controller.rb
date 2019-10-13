class MessageTemplatesController < ApplicationController
  before_action :set_message_template, only: [:show, :edit, :update, :destroy]

  def index
    @message_templates = MessageTemplate.all
  end

  def show
  end

  def new
    @message_template = MessageTemplate.new
  end

  def edit
  end

  def create
    result = MessageTemplates::Create.new(message_template_params).call

    respond_to do |format|
      if result.success?
        format.html { redirect_to result.success, notice: 'Message template was successfully created.' }
        format.json { render :show, status: :created, location: result.success }
      else
        @errors = result.failure.errors
        format.html { render :new }
        format.json { render json: result.failure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    result = MessageTemplates::Update.new(@message_template, message_template_params).call

    respond_to do |format|
      if result.success?
        format.html { redirect_to result.success, notice: 'Message template was successfully updated.' }
        format.json { render :show, status: :ok, location: result.success }
      else
        @errors = result.failure.errors
        format.html { render :edit }
        format.json { render json: result.failure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message_template.destroy
    respond_to do |format|
      format.html { redirect_to message_templates_url, notice: 'Message template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_message_template
    @message_template = MessageTemplate.find(params[:id])
  end

  def message_template_params
    params.require(:message_template).permit(:body, :title)
  end
end
