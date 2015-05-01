class AddIndustryIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :industry_id, :integer
  end
end
