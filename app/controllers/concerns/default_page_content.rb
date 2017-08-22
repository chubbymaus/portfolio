module DefaultPageContent 
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end
  def set_page_defaults
    @page_title = "Court Garr | Portfolio"
    @seo_keywords = "Court Garr Portfolio"
  end  
end  