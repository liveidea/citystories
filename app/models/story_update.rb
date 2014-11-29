class StoryUpdate < ActiveRecord::Base
  belongs_to :story
  mount_uploader :photo, PhotoUploader
end
