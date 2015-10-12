class BookmarksController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def show
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @user = current_user
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic
    @bookmark.user = @user
    if @bookmark.save
      flash[:notice] = "Your bookmark was created successfully."
    else
      puts 'bookmark save error'
    end

  	respond_to do |format|
  	   format.html
  	   format.js
  	end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Your bookmark was updated successfully."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Sorry. There was an error saving your bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Your bookmark leading to #{@bookmark.url} was destroyed successfully."
      redirect_to [@topic]
    else
      flash[:error] = "Sorry. There was an error deleting your bookmark. Try again."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :image, :image_cache)
  end
end