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

  def edit
    @portfolio_item = Mywork.find(params[:id])
  end

  def update
    @portfolio_item = Mywork.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:mywork).permit(:title, :subtitle, :body))
        format.html { redirect_to myworks_path, notice: 'The portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Mywork.find(params[:id])
  end

  def destroy
    @portfolio_item = Mywork.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to myworks_url, notice: 'The portfolio item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
