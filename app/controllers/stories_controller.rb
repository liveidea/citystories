class StoriesController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def show
    @story = Story.find_by_id(params[:id])
  end

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def follow_story
    if current_user.followed_stories.exists? (Story.find_by_id(params[:id]))
      redirect_to :back, notice: "You already follow this story" 
    else
      current_user.followed_stories << (Story.find_by_id(params[:id]))
      redirect_to :back, notice: "Success" 
    end
  end

  def unfollow_story
    current_user.followed_stories.destroy(Story.find_by_id(params[:id]))
    redirect_to :back, notice: "You unfollow this story" 
  end

  def edit
    @story = Story.find_by_id(params[:id])
  end

  def destroy
    @story = Story.find_by_id(params[:id])
    @story.destroy
    redirect_to stories_path, notice: "Story successfully deleted" 
  end

  def update
    @story = Story.find_by_id(params[:id])
    if @story.update(story_params)
      redirect_to @story, notice: "Story successfully updated"
    else
      render :edit
    end
  end

  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      redirect_to @story
    else
      render action: "new"
    end
  end

  private

  def story_params
    params.require(:story).permit(:title,:adress)
  end
end
