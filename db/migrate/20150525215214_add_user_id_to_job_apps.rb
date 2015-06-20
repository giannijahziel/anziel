class AddUserIdToJobApps < ActiveRecord::Migration
  def change
    add_column :job_apps, :user_id, :integer
  end
end
