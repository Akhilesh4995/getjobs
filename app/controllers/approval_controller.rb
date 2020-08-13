require 'rest-client'
require 'json'


class ApprovalController < ApplicationController
	before_action :authenticate_user!

	def index
		@job = Job.find_by_id(params[:job_id])
		@applicant = Applicant.find_by_id(params[:applicant_id])
		message = "Your profile has been shortlisted. #{@applicant.firstname} will be allowed in the permises."
        response = RestClient.post "http://52.91.87.75/qrcode", '{"data":{"message": "'+message+'"}}', {content_type: "application/json"}
        str = JSON.parse(response)['qrcode']
        email = @applicant.emailid
        subject = "Call letter from #{@job.company}."
        response2= RestClient.post "https://peaceful-refuge-51047.herokuapp.com/sending", {"data" => {"to_mailid" => "#{email}", "subject" => "#{subject}", "mailbody" => "#{str}"}}, :content_type => :json, :content_type => :application, :accept => :json, :accept => :application
        redirect_to job_applicants_path(@job.id)
	end
end
