require 'twilio-ruby'

class TextMessageService
  attr_reader :twilio_number, :text_number, :text_body

  def initialize(args = {})
    @twilio_number = TWILIO_NUMBER
    @text_number = args[:text_number]
    @text_body = args[:text_body]
  end

  def send_text
    client_setup

    @client.messages.create({
      :from => twilio_number,
      :to => text_number,
      :body => text_body,
      :media_url => 'https://cdn.pixabay.com/photo/2013/07/12/19/19/martini-154548_960_720.png'
    })
  end

  private

  TWILIO_NUMBER = '+13126674044'

  def client_setup
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_AUTH_TOKEN']
  end

end
