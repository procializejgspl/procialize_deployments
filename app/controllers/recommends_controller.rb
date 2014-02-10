class RecommendsController < ApplicationController
  # GET /recommends
  # GET /recommends.json
  def index
    @recommends = Recommend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recommends }
    end
  end

  # GET /recommends/1
  # GET /recommends/1.json
  def show
    @recommend = Recommend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recommend }
    end
  end

  # GET /recommends/new
  # GET /recommends/new.json
  def new
    @recommend = Recommend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recommend }
    end
  end

  # GET /recommends/1/edit
  def edit
    @recommend = Recommend.find(params[:id])
  end

  # POST /recommends
  # POST /recommends.json
  def create
    @recommend = Recommend.new(params[:recommend])

    respond_to do |format|
      if @recommend.save
        format.html { redirect_to @recommend, notice: 'Recommend was successfully created.' }
        format.json { render json: @recommend, status: :created, location: @recommend }
      else
        format.html { render action: "new" }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recommends/1
  # PUT /recommends/1.json
  def update
    @recommend = Recommend.find(params[:id])

    respond_to do |format|
      if @recommend.update_attributes(params[:recommend])
        format.html { redirect_to @recommend, notice: 'Recommend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommends/1
  # DELETE /recommends/1.json
  def destroy
    @recommend = Recommend.find(params[:id])
    @recommend.destroy

    respond_to do |format|
      format.html { redirect_to recommends_url }
      format.json { head :no_content }
    end
  end
end
