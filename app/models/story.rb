class Story < ActiveRecord::Base
  has_and_belongs_to_many :followers, class_name: "User",
  	association_foreign_key: "user_id"
  has_many :story_updates
  belongs_to :user
  validates :title, presence: true
end
