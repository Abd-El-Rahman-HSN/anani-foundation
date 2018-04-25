class RequestMaterialsController < ApplicationController
  load_and_authorize_resource param_method: :request_material_params
  
  before_action :set_request_material, only: [:show, :edit, :update, :destroy]

  # GET /request_materials
  # GET /request_materials.json
  def index
    @job_order = JobOrder.find(params[:job_order_id])
    @request_materials = @job_order.request_materials
  end

  # GET /request_materials/1
  # GET /request_materials/1.json
  def show
  end

  # GET /request_materials/new
  def new
    @request_material = RequestMaterial.new
    set_form_variables('new')
  end

  # GET /request_materials/1/edit
  def edit
    set_form_variables('edit')
  end

  # POST /request_materials
  # POST /request_materials.json
  def create
    @request_material = RequestMaterial.new(request_material_params)
    set_form_variables('create')
    @request_material.serial = @serial
    @request_material.job_order_id = @job_order.id

    respond_to do |format|
      if @request_material.save
        format.html { redirect_to @request_material, notice: 'Request material was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @request_material }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @request_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_materials/1
  # PATCH/PUT /request_materials/1.json
  def update
    set_form_variables('update')

    respond_to do |format|
      if @request_material.update(request_material_params)
        format.html { redirect_to @request_material, notice: 'Request material was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_material }
      else
        format.html { render :edit }
        format.json { render json: @request_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_materials/1
  # DELETE /request_materials/1.json
  def destroy
    @request_material.destroy
    respond_to do |format|
      format.html { redirect_to request_materials_url, notice: 'Request material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_material
      @request_material = RequestMaterial.find(params[:id])
    end

    def set_form_variables(action)
      @job_order = params[:job_order] ? JobOrder.find(params[:job_order]) : @request_material.job_order
      @raw_materials = RawMaterialWarehouse.all
      @serial = RequestMaterial.assign_serial(@job_order.id)
      @job_order_serial = @job_order.serial

      if (action == "new")
        @job_order.job_order_raw_materials.each do |raw_material|
          @request_material.request_material_lines.build(raw_material_warehouse_id: raw_material.raw_material_warehouse_id)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_material_params
      params.require(:request_material).permit(:serial, :date, :job_order, request_material_lines_attributes: [:id, :raw_material_warehouse_id, :quantity, :_destroy])
    end
end
