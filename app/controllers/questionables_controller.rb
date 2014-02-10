class QuestionablesController < ApplicationController
  # GET /questionables
  # GET /questionables.json
  def index
    @questionables = Questionable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionables }
    end
  end

  # GET /questionables/1
  # GET /questionables/1.json
  def show
    @questionable = Questionable.find(params[:id])
    @questionable.likes = @questionable.likes+1
    @questionable.Liked = true
    @questionable.save!
    redirect_to events_path,:notice => "Question has been voted up..."

  end

  # GET /questionables/new
  # GET /questionables/new.json
  def new
    @questionable = Questionable.new
    @event_id = params[:event_id]
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @questionable }
    #end
    render "questionables/new",:layout=>false
  end

  # GET /questionables/1/edit
  def edit
    @questionable = Questionable.find(params[:id])
  end

  # POST /questionables
  # POST /questionables.json
  def create
    @questionable = Questionable.new(params[:questionable])

    @questionable.Liked = false

    respond_to do |format|
      if @questionable.save
        format.html { redirect_to events_path, notice: 'Question has been asked' }
        format.json { render json: @questionable, status: :created, location: @questionable }
      else
        format.html { redirect_to events_path, notice: 'Question has not been asked' }
        format.json { render json: @questionable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionables/1
  # PUT /questionables/1.json
  def update
    @questionable = Questionable.find(params[:id])

    respond_to do |format|
      if @questionable.update_attributes(params[:questionable])
        format.html { redirect_to @questionable, notice: 'Questionable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionables/1
  # DELETE /questionables/1.json
  def destroy
    @questionable = Questionable.find(params[:id])
    @questionable.destroy

    respond_to do |format|
      format.html { redirect_to questionables_url }
      format.json { head :no_content }
    end
  end
end
