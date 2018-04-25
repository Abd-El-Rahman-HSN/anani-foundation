class MainDesignesController < ApplicationController
  def index
    @maindesignes= MainDesigne.all
    @carpetdatas = CarpetDatum.all
    @job_orders = JobOrder.accessible_by(current_ability)
  end

  def new
    @maindesigne= MainDesigne.new

  end

  def create
    @maindesigne=MainDesigne.new(maindesigns_params)
    if @maindesigne.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @maindesigne = MainDesigne.find(params[:id])
  end

  def update
    @maindesigne = MainDesigne.find(params[:id])
    if @maindesigne.update(maindesigns_params)
      redirect_to main_designes_path
    else
      render 'edit'
    end
  end

  def destroy
    @maindesigne = MainDesigne.find(params[:id])
    @maindesigne.destroy
    redirect_to main_designes_path
  end

  private
    def maindesigns_params
      params.require(:main_designe).permit(:design_code,:name,:description,:refpart,:lines)
    end
end
