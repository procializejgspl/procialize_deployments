class AttendeesController < ApplicationController
  # GET /attendees
  # GET /attendees.json
  def index
    @event  = Event.find(params[:event_id])
    @users = @event.attendees.map{|m|m.user}

    render "attendees/index",:layout=>false
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendee }
    end
  end

  # GET /attendees/new
  # GET /attendees/new.json
  def new
    att = Attendee.find_by_user_id_and_event_id(current_user.id,params[:event_id])
    if att.nil?
      @attendee = Attendee.new
      @attendee.event_id=params[:event_id]
      @attendee.user_id=current_user.id
      @attendee.save!
      redirect_to event_path(params[:event_id]),:notice => "You are now a part of this event"

    else
      att.destroy
      redirect_to event_path(params[:event_id]),:alert => "You have left this event!"
    end


  end





  # GET /attendees/1/edit
  def edit
    @attendee = Attendee.find(params[:id])
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(params[:attendee])

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
        format.json { render json: @attendee, status: :created, location: @attendee }
      else
        format.html { render action: "new" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendees/1
  # PUT /attendees/1.json
  def update
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to @attendee, notice: 'Attendee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end
end
