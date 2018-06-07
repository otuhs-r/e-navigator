class InterviewsController < ApplicationController
  before_action :set_interview, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:index, :update]
  helper_method :current_user?

  def index
    @interviews = if current_user?(@user)
                    @user.interviews.order(:scheduled_datetime)
                  else
                    @user.interviews.where(status: :pending).or(@user.interviews.where(status: :rejected)).order(:scheduled_datetime)
                  end
    @users = User.where.not(id: current_user.id)
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
    unless current_user?(@user)
      @user.reject_interviews_except(@interview)
    end
    if @interview.update(interview_params)
      redirect_to user_interviews_path(params[:user_id]), notice: 'Interview was successfully updated.'
      NotificationMailer.send_reminder_to(@user, current_user).deliver_now unless current_user?(@user)
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path(current_user.id), notice: 'Interview was successfully destroyed.'
  end

  def send_request
    NotificationMailer.send_request_to(interviewer: User.find(params[:user]), from: current_user).deliver_now
    redirect_to user_interviews_path(current_user.id), notice: 'Request was successfully sent.'
  end

  def current_user?(user)
    current_user.id == user.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:scheduled_datetime, :status)
    end
end
