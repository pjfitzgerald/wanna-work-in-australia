class ApplicationsController < ApplicationController
  def index
    @applications = Application.where(traveller: current_user)
    @job = Job.find(params[:job_id]) if params[:job_id] # job only assigned if url is the venue/job side
  end

  def show
    @application = Application.find_by(traveller: current_user, job: params[:id])
  end

  def new
    @application = Application.new
    @user = current_user
  end

  def create
    @user = current_user
    @job = Job.find(params[:job_id])
    @venue = @job.venue
    @application = Application.new(application_params)
    @application.traveller = current_user
    @application.job_id = params[:job_id]
    @application.status = "Submitted"
    # check for existing application
    if Application.find_by(traveller: @user, job_id: params[:job_id])
      render :new
      flash[:alert] = "You have already applied for this job!"
    else
      if @application.save!
        # mailer to send application to venue / VA, AND to traveller for confirmation
        ApplicationsMailer.application_submission(@user, @venue)
        # decide if the above layout makes sense to send to both the venue and the traveller as a copy, otherwise will need to add additional method in mailer
        
        redirect_to user_applications_path(current_user)
        flash[:notice] = "Congratulations, your application has been submitted."



      else
        render :new
        flash[:notice] = "Something went wrong!"
      end
    end
  end

  def edit
    @application = Application.find(params[:id])
    @job = @application.job
  end

  private

  def application_params
    params.require(:application).permit(:length_of_stay, :country_of_origin, :resume)
  end
  
end
