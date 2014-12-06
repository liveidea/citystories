class AddColumFollowersCountToStories < ActiveRecord::Migration
  def change
    add_column :stories, :followers_count, :integer, default: 0
  end
end
