class Job < ActiveRecord::Base
	has_many :job_apps, dependent: :destroy
	
	belongs_to :category
	belongs_to :parish
	belongs_to :industry
	belongs_to :user
end
