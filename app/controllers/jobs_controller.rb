require 'builder'
include ActionView::Helpers::NumberHelper


class JobsController < ApplicationController
	before_filter :authenticate_user!, except: [ :index, :show ]
	before_action	:find_job, only: [:show, :edit, :update, :destroy]
	
	def index
		if params[:category].blank? && params[:parish].blank?
			@jobs = Job.all.order("created_at DESC")
		elsif params[:category].blank? && !params[:parish].blank?
			@parish_id = Parish.find_by(name: params[:parish]).id
			@jobs = Job.where(parish_id: @parish_id).order("created_at DESC")
		elsif params[:parish].blank? && !params[:category].blank?
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		elsif !params[:parish].blank? && !params[:category].blank?
			@category_id = Category.find_by(name: params[:category]).id
			@parish_id = Parish.find_by(name: params[:parish]).id
			@jobs = Job.find(whatever).includes(:category, :parish).order("created_at DESC")
		end
	end

	def show
	end

	def new
		@job = current_user.jobs.build
	end

	def create
		@job = current_user.jobs.build(jobs_params)

		if @job.save
			redirect_to @job, notice: "Vacancy has been successfully created."
		else
			render "New"
		end	
	end

	def edit
	end

	def update
		if @job.update(jobs_params)
			redirect_to @job, notice: "Vacancy has been successfully upated."
		else
			render	"Edit"
		end
	end

	def destroy
		@job.destroy
		redirect_to root_path
	end

	private

	def jobs_params
		params.require(:job).permit(:title, :description, :company, :url, :category_id, :parish_id, :industry_id)
	end

	def find_job
		@job = Job.find(params[:id])
	end

end
