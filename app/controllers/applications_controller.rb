class ApplicationsController < ApplicationController
  def index
    @user = current_user
    @applications = Application.where(traveller: @user)
    @job = Job.find(params[:job_id]) if params[:job_id] # job only assigned if url is the venue/job side
  end

  def show
    if params[:job_id]
      @application = Application.find_by(traveller: current_user, job: params[:id])
    # else
      # @application = Application.find_by(traveller: current_user, job)
    end
  end

  def new
    @application = Application.new
    @user = current_user
  end

  def create
    @application = Application.new(traveller: current_user, job: Job.find(params[:job_id]), status: "Submitted") # add content of the application to this creation from the params
    if @application.save
      redirect_to user_applications_path(current_user)
    else
      render :new
      flash[:notice] = "Something went wrong!"
    end
  end

  def edit
    @application = Application.find(params[:id])
    @job = @application.job
  end

  private

  def application_params
    params.require(:application).permit(:traveller_id, :resume)
  end
  
end
