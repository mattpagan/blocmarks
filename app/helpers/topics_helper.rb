module TopicsHelper
  def topic_hash
    if @topic.title.include? "#"
      topic_no_hash = @topic.title.delete("#")
      topic_no_hash.capitalize!
      topic_no_hash
    else
      @topic.title.capitalize!
      @topic.title 
    end
  end
end