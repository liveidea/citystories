class StoriesController < ApplicationController

  def show
    @story = Story.find_by_id(params[:id])
  end

  def index
    @stories = Story.all
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story, notice: 'story was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :adress)
  end
end
