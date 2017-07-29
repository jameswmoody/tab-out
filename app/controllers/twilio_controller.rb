class TwilioController < ApplicationController
  def text
    TextMessageService.new({text_number: params[:text_number], text_body: params[:text_body]}).send_text
    redirect_to root_path
  end
end
