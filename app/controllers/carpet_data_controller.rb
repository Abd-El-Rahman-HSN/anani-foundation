class CarpetDataController < ApplicationController
  load_and_authorize_resource
  
  def index
    @carpetdatas = CarpetDatum.all
  end

  def new
    @carpetdata = CarpetDatum.new

  end

  def create
    @carpetdata = CarpetDatum.new(carpetdatas_params)
    if @carpetdata.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @carpetdata = CarpetDatum.find(params[:id])
  end

  def update
    @carpetdata = CarpetDatum.find(params[:id])
    if @carpetdata.update(carpetdatas_params)
      redirect_to carpetdatas_path
    else
      render 'edit'
    end
  end

  def destroy
    @carpetdata = CarpetDatum.find(params[:id])
    @carpetdata.destroy
    redirect_to carpetdatas_path
  end

  private
    def carpetdatas_params
      params.require(:carpet_datum).permit(:width,:lenght,:knot,:code,:name,:main_model,:raw_material_name,:raw_material_quantity,:number_of_rows,:name_design)
    end
end
