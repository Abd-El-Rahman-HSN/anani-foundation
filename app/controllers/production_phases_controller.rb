class ProductionPhasesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_production_phase, only: [:show, :edit, :update, :destroy]

  # GET /production_phases
  # GET /production_phases.json
  def index
    @production_phases = ProductionPhase.all
  end

  # GET /production_phases/new
  def new
    @production_phase = ProductionPhase.new
  end

  # GET /production_phases/1/edit
  def edit
  end

  # POST /production_phases
  # POST /production_phases.json
  def create
    @production_phase = ProductionPhase.new(production_phase_params)
    @production_phase.phase_no = ProductionPhase.assign_serial
    respond_to do |format|
      if @production_phase.save
        format.html { redirect_to production_phases_path, notice: 'تم عمل دورة أنتاجية جديدة' }
        format.json { render :show, status: :created, location: @production_phase }
      else
        format.html { render :new }
        format.json { render json: @production_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_phases/1
  # PATCH/PUT /production_phases/1.json
  def update
    respond_to do |format|
      if @production_phase.update(production_phase_params)
        format.html { redirect_to production_phases_path, notice: 'تم تحديث دورة أنتاجية جديدة' }
        format.json { render :show, status: :ok, location: @production_phase }
      else
        format.html { render :edit }
        format.json { render json: @production_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_phases/1
  # DELETE /production_phases/1.json
  def destroy
    @production_phase.destroy
    respond_to do |format|
      format.html { redirect_to production_phases_url, notice: 'تم مسح دورة أنتاجية' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_phase
      @production_phase = ProductionPhase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_phase_params
      params.require(:production_phase).permit(:main_material, :phase_no, :initial_letter)
    end
end
