class SuppliersController < ApplicationController
  load_and_authorize_resource param_method: :suppliers_params
  
  def index
    @suppliers= Supplier.all
    @rawmaterials= RawMaterialWarehouse.all
  end

  def new
    @supplier= Supplier.new

  end

  def create
    @supplier=Supplier.new(suppliers_params)
    if @supplier.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(suppliers_params)
      redirect_to suppliers_path
    else
      render 'edit'
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to suppliers_path
  end

  private
    def suppliers_params
      params.require(:supplier).permit(:name,:address,:phone,:person,:person_phone,:category)
    end
end
