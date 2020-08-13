class JobsController < ApplicationController
	before_action :authenticate_user!


	def new
	    @job = Job.new
    end

    def create
	@job = Job.new(params.require(:job).permit(:title, :company, :description))
	@job.user_id = current_user.id if user_signed_in?

	if @job.save
		redirect_to dashboard_path, flash: { success: "Post was created successfully!" }
	else
	    redirect_to new_job_path, flash: { danger: "Post was not saved!" }
	end    	
    end
end
