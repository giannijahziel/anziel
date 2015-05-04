class CreateJobApps < ActiveRecord::Migration
  def change
    create_table :job_apps do |t|
      t.string :email
      t.string :name
      t.string :resumelink
      t.string :linkedinprofile
      t.string :twitterlink
      t.string :weblink
      t.text :message
      t.boolean :published, :default => true
      t.references :job, index: true

      t.timestamps null: false
    end
    add_foreign_key :job_apps, :jobs
  end
end
