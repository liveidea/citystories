class CreateStoryUpdates < ActiveRecord::Migration
  def change
    create_table :story_updates do |t|
      t.text :description

      t.timestamps
    end
  end
end
