class MyworksController < ApplicationController
  def index
    @portfolio_item = Mywork.all
  end  

  def new
    @portfolio_item = Mywork.new 
  end

  def create
    @portfolio_item = Mywork.new(params.require(:mywork).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to myworks_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
end
