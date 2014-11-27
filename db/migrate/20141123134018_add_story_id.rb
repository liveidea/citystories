class AddStoryId < ActiveRecord::Migration
  def change
    add_column :story_updates, :story_id, :integer
  end
end
