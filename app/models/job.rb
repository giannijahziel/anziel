	  # t.string 	:title
   #    t.text   	:description
   #    t.string 	:company
   #    t.string 	:url
   #    t.integer 	:user_id
   #    t.integer 	:parish_id
   #    t.integer 	:category_id
   #    t.integer 	:industry_id


class Job < ActiveRecord::Base
	has_many :job_apps, dependent: :destroy
	

	belongs_to :category
	belongs_to :parish
	belongs_to :industry
	belongs_to :user


	# after_create :send_notification

	def send_notification
	    JobAppMailer.new_job(self).deliver
	end

end
