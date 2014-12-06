class StoryUpdatesController < ApplicationController
  before_action :set_story_update, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index]

  def index
    @story_updates = StoryUpdate.all.order(created_at: :desc).page(params[:page]).per(2)
    @top_stories = Story.order(followers_count: :desc).limit(3)
    @latest_stories = Story.order(created_at: :desc).limit(3)
  end

  def new
    @story_update = StoryUpdate.new
  end

  def create
    @story = Story.find_by_id(params[:story_id])
    @story_update = @story.story_updates.create(story_update_params)
    if @story_update.save
      redirect_to story_path(@story.id)
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @story_update.update(story_update_params)
      redirect_to @story_update.story, notice: "StoryUpdate successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @story_update.destroy
    redirect_to :back, notice: "StoryUpdate deleted"
  end

  private

  def set_story_update
    @story_update = StoryUpdate.find_by_id(params[:id])
  end

  def story_update_params
    params.require(:story_update).permit(:description,:story_id, :photo, :photo_cache)
  end
end
