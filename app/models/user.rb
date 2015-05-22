	  # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :jobs
  
end
