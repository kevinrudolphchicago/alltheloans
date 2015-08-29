class LoansController < ApplicationController


  def index
    @loans = Loan.all
  end

def help
end


  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new
    @loan.item = params[:item]
    @loan.friend = params[:friend]
    @loan.friend_phone = params[:friend_phone]
    @loan.picture = params[:picture]
    @loan.held = Chronic.parse(params[:held])

    if @loan.save
    redirect_to "/loancentral", :notice => "Loan successfully created"
      else
        render 'new'
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    redirect_to "/loancentral", :notice => "Loan Completed."
  end

      #This would run a continuous loop
  #def reminder
  #  if Time.now -@loan.held < 1 day
  #   then message
  #end


 def message
    @number_to_send_to = Loan.find(params[:id]).friend_phone
    @friend = Loan.find(params[:id]).friend
    @item = Loan.find(params[:id]).item

    twilio_sid = 'ACdc37ae4ed4ea6d40d8e0e08a02037a3f'
    twilio_token = '8078251ad469c0cb30fb8b6c039e2f43'
    twilio_phone_number = '+13106517025'

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+13106517025",
      :to => "+" + @number_to_send_to,
      :body => @friend + "! You have Kevin's " + @item + ", please return this at your earliest convience"
    )
    redirect_to "/loancentral", :notice => "Message Sent."
  end

  def update


    Loan.all.each do |loan|
      if Date.today > loan.held + 2
        twilio_sid = 'ACdc37ae4ed4ea6d40d8e0e08a02037a3f'
        twilio_token = '8078251ad469c0cb30fb8b6c039e2f43'
        twilio_phone_number = '+13106517025'

        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

        @twilio_client.account.sms.messages.create(
          :from => "+13106517025",
          :to => loan.friend_phone,
          :body => friend + "! You have Kevin's " + item + ", please return this in two days"
        )

      end


    end

    redirect_to "/loancentral", :notice => "update complete"
  end




end

