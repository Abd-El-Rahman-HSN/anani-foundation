class ShowroomsController < ApplicationController
  load_and_authorize_resource

  def index
    @showrooms= Showroom.all
  end

  def new
    @showroom= Showroom.new

  end

  def create
    @showroom=Showroom.new(showrooms_params)
    if @showroom.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @showroom = Showroom.find(params[:id])
  end

  def update
    @showroom = Showroom.find(params[:id])
    if @showroom.update(showrooms_params)
      redirect_to showrooms_path
    else
      render 'edit'
    end
  end

  def destroy
    @showroom = Showroom.find(params[:id])
    @showroom.destroy
    redirect_to showrooms_path
  end

  private
    def showrooms_params
      params.require(:showroom).permit(:name,:location,:address,:person_name,:person_number)
    end
end
