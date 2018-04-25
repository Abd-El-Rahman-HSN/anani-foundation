class SendGroupsController < ApplicationController
  load_and_authorize_resource param_method: :send_groups_params

  before_action :set_send_group, only: [:show, :edit, :update, :destroy]
  before_action :form_variables, only: [:new, :edit, :create, :update]


  # GET /send_groups
  # GET /send_groups.json
  def index
    @send_groups = SendGroup.accessible_by(current_ability)
  end

  # GET /send_groups/1
  # GET /send_groups/1.json
  def show
  end

  # GET /send_groups/new
  def new
    @send_group = SendGroup.new
    @job_orders = []
  end

  # GET /send_groups/1/edit
  def edit
    @job_orders = JobOrder.accessible_by(current_ability).where(workshop_id: @send_group.workshop_id)
  end

  # POST /send_groups
  # POST /send_groups.json
  def create
    @send_group = SendGroup.new(send_group_params)
    @send_group.serial = SendGroup.assign_serial(@send_group.workshop_id)
    @job_orders = JobOrder.accessible_by(current_ability).where(workshop_id: params[:send_group][:workshop_id])
    respond_to do |format|
      if @send_group.save
        format.html { redirect_to send_groups_path, notice: 'تم أرسال دفعة بنجاح' }
        format.json { render :show, status: :created, location: @send_group }
      else
        format.html { render :new }
        format.json { render json: @send_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /send_groups/1
  # PATCH/PUT /send_groups/1.json
  def update
    @job_orders = JobOrder.accessible_by(current_ability).where(workshop_id: params[:send_group][:workshop_id])

    respond_to do |format|
      if @send_group.update(send_group_params)
        format.html { redirect_to send_groups_path, notice: 'تم تحديث الدفعة بنجاح' }
        format.json { render :show, status: :ok, location: @send_group }
      else
        format.html { render :edit }
        format.json { render json: @send_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /send_groups/1
  # DELETE /send_groups/1.json
  def destroy
    @send_group.destroy
    respond_to do |format|
      format.html { redirect_to send_groups_url, notice: 'تم حذف الدفعة' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_group
      @send_group = SendGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def send_group_params
      params.require(:send_group).permit(:workshop_id, send_group_lines_attributes: [:id, :job_order_id, :_destroy])
    end

    def form_variables
      @workshops = Workshop.accessible_by(current_ability)
    end
end
