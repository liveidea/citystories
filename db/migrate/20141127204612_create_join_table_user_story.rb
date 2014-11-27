class CreateJoinTableUserStory < ActiveRecord::Migration
  def change
    create_join_table :users, :stories do |t|
       t.index [:user_id, :story_id], unique: true
       t.index [:story_id, :user_id], unique: true
    end
  end
end
