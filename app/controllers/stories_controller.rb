class StoriesController < ApplicationController
  
  def show
    @story = Story.find_by_id(params[:id])
  end

  def index 
    @stories = Story.all
  end 

  private

  def story_params
    params.require(:story).permit(:title)
  end
end
