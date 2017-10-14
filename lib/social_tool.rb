module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

<<<<<<< HEAD
    client.user_timeline("techcrunch", result_type: 'recent').take(6).collect do |tweet|
      "@#{tweet.user.screen_name}:<br> #{tweet.text}".html_safe
=======
    client.search("#rails", result_type: 'recent').take(6).collect do |tweet|
      "#{tweet.user.screen_name}:<br> #{tweet.text}".html_safe
    
>>>>>>> 6552d08d1ce105b333fb56d053a8572aac3d359e
    end  
  end  
end  