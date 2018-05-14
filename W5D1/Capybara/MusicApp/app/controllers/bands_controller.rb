class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end


  def new
    @band = Band.new
    render :new
  end


  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end



  def edit
    @band = Band.new
    render :edit
  end



  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      render plain: "#{@band.name} has been updated"
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def band_params
    params.require(:band).permit(:name)
  end

end
