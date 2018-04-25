class JobOrdersController < ApplicationController
  load_and_authorize_resource param_method: :job_orders_params
  
  before_action :form_variables, only: [:new, :edit, :create, :update]

  def index
    @job_orders = JobOrder.accessible_by(current_ability)
  end

  def new
    @job_order = JobOrder.new
    @job_order_one = JobOrderWorker.new
    @job_order_raw_one = JobOrderRawMaterial.new
    @carpet = CarpetDatum.new
    @workers = []
  end

  def show
    @job_order = JobOrder.find(params[:id])
  end

  def create
    @job_order = JobOrder.new(job_orders_params)
    @job_order.serial = JobOrder.assign_serial(@job_order.workshop_id, Date.today)
    form_create_variables
    if @job_order.save
      redirect_to(:action=>'index')
    else
      render('new')
    end
  end

  def edit
    @job_order = JobOrder.find(params[:id])
    @job_order_one = nil
    @job_order_raw_one = nil
    @carpet = nil
    @workers = Worker.accessible_by(current_ability).where(workshop_id: @job_order.workshop_id)
    @workshops = Workshop.accessible_by(current_ability).where(location_id: @job_order.location_id)
    @looms = Loom.accessible_by(current_ability).where(workshop_id: @job_order.workshop_id)
  end

  def update
    @job_order = JobOrder.find(params[:id])
    @workshops = Workshop.accessible_by(current_ability).where(location_id: params[:job_order][:location_id])
    @looms = Loom.where(workshop_id: params[:job_order][:workshop_id])

    if @job_order.update(job_orders_params)
      redirect_to job_order_path(@job_order)
    else
      render 'edit'
    end
  end

  def destroy
    @job_order = JobOrder.find(params[:id])
    @job_order.destroy
    redirect_to job_orders_path
  end

  private
    def job_orders_params
      params.require(:job_order).permit(:item, :location_id, :workshop_id, :loom_id, :production_phase_id, :status, carpet_datum_attributes: [:id, :name, :number_of_rows, :name_design, :seda, :area, :length, :width, :area, :knot, :price_hundred], job_order_workers_attributes: [:id, :worker_id, :_destroy], job_order_raw_materials_attributes: [:id, :raw_material_warehouse_id, :_destroy])
    end

    def form_variables
      @production_phases = ProductionPhase.all
      @raw_materials = RawMaterialWarehouse.all
      @carpet_datas = CarpetDatum.all
    end

    def form_create_variables
      @workshops_create = Workshop.accessible_by(current_ability).where(location_id: params[:job_order][:location_id])
      @looms_create = Loom.where(workshop_id: params[:job_order][:workshop_id])
      @workers = Worker.accessible_by(current_ability).where(workshop_id: params[:job_order][:workshop_id])
    end
end
