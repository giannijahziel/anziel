class JobAppsController < ApplicationController

	def create
		@job = Job.find(params[:job_id])
		@new_jobapp = @job.job_apps.create(params.require(:job_app).permit(
			:email,
			:name,
			:resumelink,
			:linkedinprofile,
			:twitterlink,
			:weblink,
			:message
			))

		redirect_to job_path(@job)
	end

	def destroy
		@job = Job.find(params[:job_id])
		@jobapp = @job.job_apps.find(params[:id])
		@jobapp.destroy

		redirect_to job_path(@job)
		
	end

end
