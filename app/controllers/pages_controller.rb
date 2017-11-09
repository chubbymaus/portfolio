class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skills = Skill.all
    @contact = Contact.new
  end

  def about
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end  
end