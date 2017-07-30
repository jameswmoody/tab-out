class TwilioController < ApplicationController
  def text
    phone = +12607979836
    TextMessageService.new({text_number: phone, text_body: 'Get back in the bar'}).send_text
    redirect_to root_path
  end
end
