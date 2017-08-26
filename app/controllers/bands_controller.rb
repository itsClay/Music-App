class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to
    else
      flash.now[:errors] = @bands.errors.full_messages
      render :show
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to bands_url
    else
      flash.now[:errors] = @bands.errors.full_messages
      render :show
    end
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    render :index
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
