class ApplicantsController < ApplicationController
    before_action :authenticate_user!

	def new
		@job = Job.find(params[:job_id])
		@applicant = @job.applicants.build
    end
    def create
         @job = Job.find(params[:job_id])
         @applicant = @job.applicants.build(params.require(:applicant).permit(:firstname,:lastname,:emailid,:interest,:experience))
         if @applicant.save
		    redirect_to dashboard_path 
		else
             render :action => "new" 
        end
    end

    def index
    	@job = Job.find(params[:job_id])
         @applicants = @job.applicants
    end
end
