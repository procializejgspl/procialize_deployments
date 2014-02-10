class DownloadblesController < ApplicationController
  # GET /downloadbles
  # GET /downloadbles.json
  def index
    @downloadbles = Downloadble.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @downloadbles }
    end
  end

  # GET /downloadbles/1
  # GET /downloadbles/1.json
  def show
    @downloadble = Downloadble.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @downloadble }
    end
  end

  # GET /downloadbles/new
  # GET /downloadbles/new.json
  def new
    @downloadble = Downloadble.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @downloadble }
    end
  end

  # GET /downloadbles/1/edit
  def edit
    @downloadble = Downloadble.find(params[:id])
  end

  # POST /downloadbles
  # POST /downloadbles.json
  def create
    @downloadble = Downloadble.new(params[:downloadble])

    respond_to do |format|
      if @downloadble.save
        format.html { redirect_to @downloadble, notice: 'Downloadble was successfully created.' }
        format.json { render json: @downloadble, status: :created, location: @downloadble }
      else
        format.html { render action: "new" }
        format.json { render json: @downloadble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /downloadbles/1
  # PUT /downloadbles/1.json
  def update
    @downloadble = Downloadble.find(params[:id])

    respond_to do |format|
      if @downloadble.update_attributes(params[:downloadble])
        format.html { redirect_to @downloadble, notice: 'Downloadble was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @downloadble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /downloadbles/1
  # DELETE /downloadbles/1.json
  def destroy
    @downloadble = Downloadble.find(params[:id])
    @downloadble.destroy

    respond_to do |format|
      format.html { redirect_to downloadbles_url }
      format.json { head :no_content }
    end
  end
end
