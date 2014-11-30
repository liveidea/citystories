class StoriesController < ApplicationController


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
