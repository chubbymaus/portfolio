class MyworksController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "myworks"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  def index
    @portfolio_items = Mywork.by_position
    
  end  

  def sort
    params[:order].each do |key, value|
      Mywork.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def angular
    @angular_portfolio_item = Mywork.angular
  end  

  def new
    @portfolio_item = Mywork.new 
  end

  def create
    @portfolio_item = Mywork.new(mywork_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to myworks_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    
  end

  def update
    

    respond_to do |format|
      if @portfolio_item.update(mywork_params)
        format.html { redirect_to myworks_path, notice: 'The portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to myworks_url, notice: 'The portfolio item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def mywork_params
    params.require(:mywork).permit(:title, 
                                   :subtitle, 
                                   :body, 
                                   :main_image,
                                   :thumb_image,
                                   technologies_attributes: [:id, :name, :_destroy]
                                   )
  end
  def set_portfolio_item
    @portfolio_item = Mywork.find(params[:id])
  end  
end
