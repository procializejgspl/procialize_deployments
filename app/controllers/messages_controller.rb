class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @unread = Recipient.find_all_by_user_id_and_status(current_user.id, false).map { |r| r.message }.reverse
    @read = Recipient.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.message }.reverse
    @sent = Message.find_all_by_user_id(current_user.id).last(10).reverse



  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    @sent = Message.find_all_by_user_id(current_user.id).last(10).reverse
    if @recipient=Recipient.find_by_user_id_and_message_id(current_user.id, @message.id)
      @recipient.status=true
      @recipient.save
    end
    render "messages/show",:layout=>false

  end


  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    @disable_users = false
    @receipient = params[:rcpt]
    if params[:type]=="cnt"
        @message_subject = "Inquiry by "+current_user.name
        @disable_users = true
         @message_text = Customizer.first.contact_us_body
    end
     if !params[:prev_msg].nil?
       message = Message.find(params[:prev_msg])
       @message_text  = "\n\n\n\n\n\n\n-------Original Message:-------- \n"+message.body
       @message_subject = params[:type]+":"+message.subject
     end
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @message }
    #end
    render "messages/new" ,:layout=>false

  end

  def focussed_new
    @message = Message.new
    @recipient = params[:id]
    @all=false
    @last_message=nil
    unless params[:message].blank?
      @last_message=Message.find(params[:message])
      unless params[:all].blank?
        @recipients=@last_message.recipients.map { |r| r.user.id }
        @all=true
      end
    end
  end



  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new
    @message.user_id = current_user.id
    @message.body = params[:body]
    @message.subject = params[:subject]

    respond_to do |format|
      begin

        if !params["recipients"].blank?
          params["recipients"].delete("multiselect-all")
          params["recipients"].each do |m|

            @message.recipients.build(:user_id=>m,:status=>false)
            User.find(m).employees.each do |e|
              @message.recipients.build(:user_id=>e.people.id,:status=>false)
            end
          end
        end


        #check all validations in the model
        @message.save!
        format.html { redirect_to messages_path, :notice => 'Message sent successfully.' }
        format.json { head :no_content }
      rescue => e
        format.html { redirect_to messages_path ,:alert=>e.message}
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def mark_message
    r = Recipient.find_by_message_id(params[:message_id])
    r.status = params[:mark]
    r.save!
    redirect_to messages_path,:notice=>"Message marked as" +params[:mark]

  end
end
