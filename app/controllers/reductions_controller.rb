class ReductionsController < ApplicationController
  before_action :set_reduction, only: [:show, :edit, :update, :destroy]

  before_action :form_variables, only: [:new, :edit, :create, :update]

  # GET /reductions
  # GET /reductions.json
  def index
    @reductions = Reduction.all
  end

  # GET /reductions/1
  # GET /reductions/1.json
  def show
  end

  # GET /reductions/new
  def new
    @reduction = Reduction.new
    @workers = []
  end

  # GET /reductions/1/edit
  def edit
    @workers = Worker.where(workshop_id: @reduction.workshop_id)
  end

  # POST /reductions
  # POST /reductions.json
  def create
    @reduction = Reduction.new(reduction_params)
    @workers_create = Worker.where(workshop_id: params[:reduction][:workshop_id])

    respond_to do |format|
      if @reduction.save
        format.html { redirect_to reductions_path, notice: 'تم خصم المبلغ' }
        format.json { render :show, status: :created, location: @reduction }
      else
        format.html { render :new }
        format.json { render json: @reduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reductions/1
  # PATCH/PUT /reductions/1.json
  def update
    @workers = Worker.where(workshop_id: params[:reduction][:workshop_id])
    respond_to do |format|
      if @reduction.update(reduction_params)
        format.html { redirect_to reductions_path, notice: 'تم تعديل الخصم' }
        format.json { render :show, status: :ok, location: @reduction }
      else
        format.html { render :edit }
        format.json { render json: @reduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reductions/1
  # DELETE /reductions/1.json
  def destroy
    @reduction.destroy
    respond_to do |format|
      format.html { redirect_to reductions_url, notice: 'تم ألغاء الخصم' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reduction
      @reduction = Reduction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reduction_params
      params.require(:reduction).permit(:cost, :worker_id, :workshop_id)
    end

    def form_variables
      @workshops = Workshop.all
    end
end
