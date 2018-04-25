class WarehouseTransactionsController < ApplicationController
  load_and_authorize_resource param_method: :warehouse_transaction_params
  
  before_action :set_warehouse_transaction, only: [:show, :edit, :update, :destroy]

  # GET /warehouse_transactions
  # GET /warehouse_transactions.json
  def index
    @warehouse_transactions = WarehouseTransaction.all
    @suppliers= Supplier.all
  end

  # GET /warehouse_transactions/1
  # GET /warehouse_transactions/1.json
  def show
  end

  # GET /warehouse_transactions/new
  def new
    @warehouse_transaction = WarehouseTransaction.new
    set_form_variables('new')
     @suppliers= Supplier.new
  end

  # GET /warehouse_transactions/1/edit
  def edit
    set_form_variables('edit')
    @status = params[:status]

  end

  # POST /warehouse_transactions
  # POST /warehouse_transactions.json
  def create
    @warehouse_transaction = WarehouseTransaction.new(warehouse_transaction_params)
    @warehouse_transaction.serial = WarehouseTransaction.assign_serial
    set_form_variables('create')
    @warehouse_transaction.status = @status

    respond_to do |format|
      if @warehouse_transaction.save
        format.html { redirect_to @warehouse_transaction, notice: 'Warehouse transaction was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @warehouse_transaction }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @warehouse_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warehouse_transactions/1
  # PATCH/PUT /warehouse_transactions/1.json
  def update
    set_form_variables('update')
    @status = params[:warehouse_transaction][:status]

    respond_to do |format|
      if @warehouse_transaction.update(warehouse_transaction_params)
        format.html { redirect_to @warehouse_transaction, notice: 'Warehouse transaction was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @warehouse_transaction }
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @warehouse_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouse_transactions/1
  # DELETE /warehouse_transactions/1.json
  def destroy
    @warehouse_transaction.destroy
    respond_to do |format|
      format.html { redirect_to raw_material_warehouses_url, notice: 'Warehouse transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse_transaction
      @warehouse_transaction = WarehouseTransaction.find(params[:id])
    end

    def set_form_variables(action)
      if action == 'new'
        @status = params[:status]
        if @status == 'release'
          @request_material = RequestMaterial.find(params[:request_material_id])
          @request_material.request_material_lines.each do |line|
            transactions = WarehouseTransactionLine.where(request_material_line_id: line.id)
            required_quantity = transactions.count > 0 ? line.quantity - transactions.pluck(:quantity).reduce(:+) : line.quantity
            @warehouse_transaction.warehouse_transaction_lines.build(raw_material_warehouse_id: line.raw_material_warehouse_id, required_quantity: required_quantity, available_quantity: line.raw_material_warehouse.quantity, request_material_line_id: line.id)
          end
        end
      elsif action == 'create'
        @status = params[:warehouse_transaction][:status]
      end

      @raw_materials = RawMaterialWarehouse.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def warehouse_transaction_params
      params.require(:warehouse_transaction).permit(:date, :name, :request_material_id, warehouse_transaction_lines_attributes: [:id, :status, :raw_material_warehouse_id, :name, :required_quantity, :available_quantity, :request_material_line_id, :quantity,:unit, :_destroy])
    end
end
