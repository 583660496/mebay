class AdsController < ApplicationController
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
  
  private
  def ad_params
    params.require(:ad).permit(:name,:description,:price,:seller_id,:email,:img_url)
  end

end
