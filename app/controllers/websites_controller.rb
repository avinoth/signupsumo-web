class WebsitesController < ApplicationController

  before_action :set_website, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  
  def index
    @websites = Website.all
  end

  
  def show
  end

  
  def new
    @website = Website.new
  end


  def edit
  end


  def create
    @user = current_user
    @website = @user.websites.new(website_params)

    if @website.save
      redirect_to @website, notice: 'Website successfully created.'

    else
      render :new
    end
  end


  def update
    if @website.update(website_params)
      redirect_to @website, notice: 'Website was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @website.destroy
    redirect_to websites_url, notice: 'Website was successfully deleted.'
  end


  private
    def set_website
      @website = Website.find(params[:id])
    end

    def website_params
      params[:website].permit(:name, :host)
    end

end
