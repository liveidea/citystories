class StoryUpdatesController < ApplicationController
  def index
    @story_updates = StoryUpdate.all
  end

  def new
    @story = Story.find_by_id(params[:id])
    @story_update = StoryUpdate.new
  end

  def create
    @story = Story.find_by_id(params[:story_id])
    @story_update = @story.story_updates.create(story_update_params)
    if @story_update.save
      redirect_to story_story_updates_path
    else
      render action: "new"
    end
  end

  private

  def story_update_params
    params.require(:story_update).permit(:description,:story_id)
  end
end
