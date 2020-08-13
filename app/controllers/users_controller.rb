class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
        if current_user.roll == "HR"
        	@job = Job.where(user_id: current_user.id)
        else
        	@job = Job.all
        end
	end

	
end
