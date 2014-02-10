class EventDaysController < ApplicationController
  # GET /event_days
  # GET /event_days.json
  def index
    @event_days = EventDay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_days }
    end
  end

  # GET /event_days/1
  # GET /event_days/1.json
  def show
    @event_day = EventDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_day }
    end
  end

  # GET /event_days/new
  # GET /event_days/new.json
  def new
    @event_day = EventDay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_day }
    end
  end

  # GET /event_days/1/edit
  def edit
    @event_day = EventDay.find(params[:id])
  end

  # POST /event_days
  # POST /event_days.json
  def create
    @event_day = EventDay.new(params[:event_day])

    respond_to do |format|
      if @event_day.save
        format.html { redirect_to @event_day, notice: 'Event day was successfully created.' }
        format.json { render json: @event_day, status: :created, location: @event_day }
      else
        format.html { render action: "new" }
        format.json { render json: @event_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_days/1
  # PUT /event_days/1.json
  def update
    @event_day = EventDay.find(params[:id])

    respond_to do |format|
      if @event_day.update_attributes(params[:event_day])
        format.html { redirect_to @event_day, notice: 'Event day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_days/1
  # DELETE /event_days/1.json
  def destroy
    @event_day = EventDay.find(params[:id])
    @event_day.destroy

    respond_to do |format|
      format.html { redirect_to event_days_url }
      format.json { head :no_content }
    end
  end
end
