class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.new
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    @bookmark = @bookmarks.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @new_topic = Topic.new
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic was created successfully."
    else
      flash[:error] = "There was an error creating your topic. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      redirect_to @topic, notice: "Topic was updated successfully."
    else
      flash[:error] = "There was an error updating your topic please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
end

private

def topic_params
  params.require(:topic).permit(:title)
end