class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :edit, :update, :destroy]

  # GET /tutorials
  # GET /tutorials.json
  def index
    Rails.logger.info("Landing page")
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
    Rails.logger.info("show tutorial")
    tutorial = Tutorial.find(params[:id])
    render json: {
        tutorials: tutorial
    }
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    Rails.logger.info(tutorial_params)
    @tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
      render json: {
          message: "Created Tutorial Successfully"
      }
    else
      Rails.logger.info("error while creating")
    end
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: 'Tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      # params.fetch(:tutorial, {})
      params.require(:tutorial).permit(:name, :subject, :author)
    end
end
