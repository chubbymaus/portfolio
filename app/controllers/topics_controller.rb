class TopicsController < ApplicationController
  layout 'blog'
  def index
    @topics = Topic.all
    @tweets = SocialTool.twitter_search
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else  
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end  
    @tweets = SocialTool.twitter_search
  end
end
