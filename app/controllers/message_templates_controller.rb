class MessageTemplatesController < ApplicationController
  before_action :set_message_template, only: [:show, :edit, :update, :destroy]

  def index
    @message_templates = MessageTemplate.active
  end

  def show
  end

  def new
    @message_template = MessageTemplate.new
  end

  def edit
  end

  def create
    @message_template = MessageTemplate.new(message_template_params)

    respond_to do |format|
      if @message_template.save
        format.html { redirect_to @message_template, notice: 'Message template was successfully created.' }
        format.json { render :show, status: :created, location: @message_template }
      else
        format.html { render :new }
        format.json { render json: @message_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message_template.update(message_template_params)
        format.html { redirect_to @message_template, notice: 'Message template was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_template }
      else
        format.html { render :edit }
        format.json { render json: @message_template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message_template.archive
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
