class InterviewsController < ApplicationController
  before_action :set_interview, only: [:edit, :update, :destroy]

  # GET /interviews
  # GET /interviews.json
  def index
    user = User.find(params[:user_id])
    @interviews = user.interviews.order(:scheduled_datetime)
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
  end

  # GET /interviews/new
  def new
    @interview = current_user.interviews.build
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = current_user.interviews.build(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to user_interviews_path(current_user.id), notice: 'Interview was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to user_interviews_path(current_user.id), notice: 'Interview was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to user_interviews_path(current_user.id), notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = current_user.interviews.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:scheduled_datetime, :accepted)
    end
end
