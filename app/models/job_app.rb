
      # t.string    :email
      # t.string    :name
      # t.string    :resumelink
      # t.string    :linkedinprofile
      # t.string    :twitterlink
      # t.string    :weblink
      # t.text      :message
      # t.integer   :user_id

      # t.boolean         :published, :default => true
      # t.references      :job, index: true
      # t.timestamps      null: false
      # add_foreign_key   :job_apps, :jobs


class JobApp < ActiveRecord::Base
  belongs_to :job
  belongs_to :user

  after_create :send_notification

  def send_notification
      JobAppMailer.new_jobapp(self).deliver
  end


end
