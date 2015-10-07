class LikesController < ApplicationController
	def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
 
     if like.save!
      puts("like registered")
    else
      flash[:error] = "There was an error liking that post. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      puts("dislike registered")
    else
      flash[:error] = "There was an error unliking that post. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
