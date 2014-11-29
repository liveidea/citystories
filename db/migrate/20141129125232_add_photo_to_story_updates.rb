class AddPhotoToStoryUpdates < ActiveRecord::Migration
  def change
    add_column :story_updates, :photo, :string
  end
end
