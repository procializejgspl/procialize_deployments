class MeetersController < ApplicationController
  # GET /meeters
  # GET /meeters.json
  def index
    @meeters = Meeter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meeters }
    end
  end

  # GET /meeters/1
  # GET /meeters/1.json
  def show
    @meeter = Meeter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeter }
    end
  end

  # GET /meeters/new
  # GET /meeters/new.json
  def new
    @meeter = Meeter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeter }
    end
  end

  # GET /meeters/1/edit
  def edit
    @meeter = Meeter.find(params[:id])
  end

  # POST /meeters
  # POST /meeters.json
  def create
    @meeter = Meeter.new(params[:meeter])

    respond_to do |format|
      if @meeter.save
        format.html { redirect_to @meeter, notice: 'Meeter was successfully created.' }
        format.json { render json: @meeter, status: :created, location: @meeter }
      else
        format.html { render action: "new" }
        format.json { render json: @meeter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meeters/1
  # PUT /meeters/1.json
  def update
    @meeter = Meeter.find(params[:id])

    respond_to do |format|
      if @meeter.update_attributes(params[:meeter])
        format.html { redirect_to @meeter, notice: 'Meeter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeters/1
  # DELETE /meeters/1.json
  def destroy
    @meeter = Meeter.find(params[:id])
    @meeter.destroy

    respond_to do |format|
      format.html { redirect_to meeters_url }
      format.json { head :no_content }
    end
  end
end
