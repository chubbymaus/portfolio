class MyworksController < ApplicationController
  def index
    @portfolio_items = Mywork.all
  end  
end
