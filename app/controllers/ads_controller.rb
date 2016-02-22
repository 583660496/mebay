class AdsController < ApplicationController
  before_filter :check_logged_in, :only => [:edit, :update, :destroy]

  def show
    @ad = Ad.find(params[:id])
  end

  def index
    @ads = Ad.all.each
  end
 
  def new 
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.save
    redirect_to "/ads/#{@ad.id}"
  end
  
  def edit 
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update_attributes(ad_params)
    redirect_to "/ads/#{@ad.id}"
  end 

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to "/ads/"
  end
 
  private
  def ad_params
    params.require(:ad).permit(:name,:description,:price,:seller_id,:email,:img_url)
  end
  
  def check_logged_in
    authenticate_or_request_with_http_basic ("Ads") do |a,b|
      a == "admin" && b == "123456"
    end
  end

end
