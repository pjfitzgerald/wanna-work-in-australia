class ApplicationsController < ApplicationController
  def index
    @applications = Application.where(traveller: current_user)
    @job = Job.find(params[:job_id]) if params[:job_id] # job only assigned if url is the venue/job side
  end

  def show
    if params[:job_id]  # for when we are on the venue/job/applications route
      @application = Application.find_by(traveller: current_user, job: params[:id])
    else  # for when we are on the user/applications route
      @application = Application.find(params[:id])
    end
  end

  def new
    @job = Job.find(params[:job_id])
    @application = Application.new
    @user = current_user
  end

  def create
    @user = current_user
    @job = Job.find(params[:job_id])
    @venue = @job.venue
    # check for existing application
    if Application.find_by(traveller: @user, job_id: params[:job_id])
      render :new
      flash[:alert] = "You have already applied for this job!"
    else
      @application = Application.new(application_params)
      @application.traveller = current_user
      @application.job_id = params[:job_id]
      @application.status = "Submitted"
      if params[:application][:length_of_stay].empty?
        render :new
        flash[:notice] = "Please select your anticipated length of stay!"
      elsif params[:application][:country_of_origin].empty?
        render :new
        flash[:notice] = "Please select your country of origin!"
      else
        if @application.save!
          redirect_to user_applications_path(current_user)
          # mailer to send application to venue / VA, AND to traveller for confirmation
          ApplicationsMailer.application_submission(@user, @job)
          # decide if the above layout makes sense to send to both the venue and the traveller as a copy, otherwise will need to add additional method in mailer
          
          flash[:notice] = "Congratulations, your application has been submitted."

        else
          render :new
          flash[:notice] = "Something went wrong!"
        end
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
