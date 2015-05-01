class Job < ActiveRecord::Base
	belongs_to :category
	belongs_to :parish
	belongs_to :industry
end
