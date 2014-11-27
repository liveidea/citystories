class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
  has_and_belongs_to_many :orders, class_name: "Story", association_foreign_key: "story_id"
=======
>>>>>>> 1d0a9ddcf9183ac145e285324661fbe34b793fd4
end
