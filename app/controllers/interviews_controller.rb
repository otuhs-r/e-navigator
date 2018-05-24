class InterviewsController < ApplicationController
  before_action :set_interview, only: [:edit, :update, :destroy]

  def index
    user = User.find(params[:user_id])
    @interviews = user.interviews.order(:scheduled_datetime)
  end

  def show
  end

  def new
    @interview = current_user.interviews.build
  end

  def edit
  end

  def create
    @interview = current_user.interviews.build(interview_params)

    if @interview.save
      redirect_to user_interviews_path(current_user.id), notice: 'Interview was successfully created.'
    else
      render :new
    end
  end

  def update
    if @interview.update(interview_params)
      redirect_to user_interviews_path(current_user.id), notice: 'Interview was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path(current_user.id), notice: 'Interview was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = current_user.interviews.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:scheduled_datetime, :status)
    end
end
