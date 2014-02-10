class CustomPagesController < ApplicationController
  # GET /custom_pages
  # GET /custom_pages.json
  layout "custom_page"
  def index
    @custom_pages = CustomPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @custom_pages }
    end
  end

  # GET /custom_pages/1
  # GET /custom_pages/1.json
  def show
    @custom_page = CustomPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @custom_page }
    end
  end

  # GET /custom_pages/new
  # GET /custom_pages/new.json
  def new
    @custom_page = CustomPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @custom_page }
    end
  end

  # GET /custom_pages/1/edit
  def edit
    @custom_page = CustomPage.find(params[:id])
  end

  # POST /custom_pages
  # POST /custom_pages.json
  def create
    @custom_page = CustomPage.new(params[:custom_page])

    respond_to do |format|
      if @custom_page.save
        format.html { redirect_to @custom_page, notice: 'Custom page was successfully created.' }
        format.json { render json: @custom_page, status: :created, location: @custom_page }
      else
        format.html { render action: "new" }
        format.json { render json: @custom_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /custom_pages/1
  # PUT /custom_pages/1.json
  def update
    @custom_page = CustomPage.find(params[:id])

    respond_to do |format|
      if @custom_page.update_attributes(params[:custom_page])
        format.html { redirect_to @custom_page, notice: 'Custom page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @custom_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_pages/1
  # DELETE /custom_pages/1.json
  def destroy
    @custom_page = CustomPage.find(params[:id])
    @custom_page.destroy

    respond_to do |format|
      format.html { redirect_to custom_pages_url }
      format.json { head :no_content }
    end
  end
  def participate_in_survey
    @survey = Survey.find(params[:id])
  end

   def submit_survey_answer
     SurveyAnswer.where("user_id = ?",current_user.id).destroy_all
     @survey = Survey.find(params[:survey_id])
     @survey.questions.each do |q|
       SurveyAnswer.create!(:question_id=>q.id,:option_id=>params[q.id.to_s],user_id:current_user.id)
     end
     redirect_to root_path,:notice => "Survey answer successfully recorded"

   end


end
