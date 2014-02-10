class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index



    @meetings = Meeting.all
    @user = current_user
    @pending = Meeter.find_all_by_user_id_and_status(current_user.id, 0).map { |r| r.meeting }
    @scheduled = Meeter.find_all_by_user_id_and_status(current_user.id, 1).map { |r| r.meeting }
    @declined = Meeter.find_all_by_user_id_and_status(current_user.id, 2).map { |r| r.meeting }
    @sent = Meeting.find_all_by_user_id(@user.id).last(10).reverse



  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])
    @meeter=@meeting.meeters.where('user_id=?',current_user.id).first
    render "meetings/show",:layout=>false
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @receipient = params[:rcpt]
    @meeting = Meeting.new
    render "meetings/new",:layout=>false

  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    s = params[:date]+" "+params[:time]
    @meeting = Meeting.new
    #@meeting.start_time = DateTime.new(params[:start_date][:year].to_i,params[:start_date][:month].to_i,params[:start_date][:day].to_i,params[:start_date][:hour].to_i,params[:start_date][:minute].to_i)
    @meeting.start_time = s
    #@meeting.start_time = s.to_time
    @meeting.location = params[:meeting_location]
    @meeting.user_id = current_user.id
    @meeting.name = params[:name]

  respond_to do |format|
    begin
      if !params["meeters"].blank?
      params["meeters"].each do |m|
        @meeting.meeters.build(:user_id=>m,:status=>0)
      end
      end
      @meeting.meeters.build(:user_id=>current_user.id,:status=>1)

      #check all validations in the model
      @meeting.save!
      format.html { redirect_to meetings_path, :notice => 'Meeting was successfully created.' }
      format.json { head :no_content }
    rescue => e
      format.html { redirect_to meetings_path ,:alert=>e.message}
      format.json { render :json => @meeting.errors, :status => :unprocessable_entity }
    end
  end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end

  def accept
    @meeter = Meeter.find_by_meeting_id_and_user_id(params[:meeting_id],current_user.id)
    @meeter.status=params[:decision]
    @meeter.save
    redirect_to meetings_path ,:notice=>"Decision is recorded"
  end
end
