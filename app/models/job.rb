class Job < ActiveRecord::Base
	has_many :job_apps, dependent: :destroy
	
	belongs_to :category
	belongs_to :parish
	belongs_to :industry
	belongs_to :user


    #filterrific
	filterrific(
		default_filter_params: { sorted_by: 'created_at_asc' },
		available_filters: [
	    	:sorted_by,
	    	:with_parish_id,
	    	:with_created_at_gte
		]
	)

	scope :with_parish_id, lambda { |id|
	  where(id: [*id])
	}

	scope :sorted_by, lambda { |sort_option|
	  # extract the sort direction from the param value.
	  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  case sort_option.to_s
	  when /^created_at_/
	    # Simple sort on the created_at column.
	    # Make sure to include the table name to avoid ambiguous column names.
	    # Joining on other tables is quite common in Filterrific, and almost
	    # every ActiveRecord table has a 'created_at' column.
	    order("jobs.created_at #{ direction }")
	  when /^name_/
	    # Simple sort on the name colums
	    order("LOWER(jobs.title) #{ direction }")
	  when /^country_name_/
	    # This sorts by a student's country name, so we need to include
	    # the country. We can't use JOIN since not all students might have
	    # a country.
	    order("LOWER(parishes.name) #{ direction }").includes(:parish)
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
	}

  	def self.options_for_sorted_by
    [
      ['Title (a-z)', 'title_asc'],
      ['Post date (newest first)', 'created_at_desc'],
      ['Post date (oldest first)', 'created_at_asc'],
      ['Parish (a-z)', 'parish_name_asc']
    ]
  	end

end
