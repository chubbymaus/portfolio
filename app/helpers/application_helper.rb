module ApplicationHelper
  def login_helper style = ''
     if current_user.is_a?(GuestUser) 
      (link_to "Register", new_user_registration_path, class: style) + " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)      
     else 
       link_to "Logout", destroy_user_session_path, method: :delete, class: style 
     end  
  end  

  def source_helper(layout_name)
    if session[:source] 
      greeting = "Thanks for visiting me from  #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting" )
    end 
  end 

  def copyright_generator
    InfernoViewTool::Renderer.copyright 'Court Garr', ''
  end

  def nav_items
    [
      {

        url: root_path,
        title: 'Home'
      },

      {

        url: blogs_path,
        title: 'Blog'
      },
      {

        url: myworks_path,
        title: 'Portfolio'
      },
      {

        url: new_contact_path,
        title: 'Contact Me'
      },



    ]
  end  

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end  
      

    nav_links.html_safe
  end  

  def active? path
    "active" if current_page? path
  end  

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end  
  end  

  def alert_generator msg
    js add_gritter(msg, sticky: false, time: 1500) 
  end  


  def twitter_parser tweet
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe
  end
end
