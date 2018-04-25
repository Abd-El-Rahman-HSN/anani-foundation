class ReceiveGroupsController < ApplicationController
  load_and_authorize_resource param_method: :receive_group_params

  before_action :set_receive_group, only: [:show, :edit, :update, :destroy]
  before_action :form_variables, only: [:new, :edit, :create, :update]

  # GET /receive_groups
  # GET /receive_groups.json
  def index
    @receive_groups = ReceiveGroup.all
  end

  # GET /receive_groups/1
  # GET /receive_groups/1.json
  def show
  end

  # GET /receive_groups/new
  def new
    @receive_group = ReceiveGroup.new
    @send_group = SendGroup.find(params[:send_group_id])
    @send_group.send_group_lines.each do |line|
      @receive_group.receive_group_lines.build(job_order_id: line.job_order_id)
    end
  end

  # GET /receive_groups/1/edit
  def edit
    @send_group = @receive_group.send_group
  end

  # POST /receive_groups
  # POST /receive_groups.json
  def create
    @receive_group = ReceiveGroup.new(receive_group_params)
    @send_group = SendGroup.find(params[:receive_group][:send_group_id])
    respond_to do |format|
      if @receive_group.save
        format.html { redirect_to receive_groups_path, notice: 'تم أستقبال الدفعة بنجاح' }
        format.json { render :show, status: :created, location: @receive_group }
        format.js
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @receive_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receive_groups/1
  # PATCH/PUT /receive_groups/1.json
  def update
    @send_group = SendGroup.find(params[:receive_group][:send_group_id])
    respond_to do |format|
      if @receive_group.update(receive_group_params)
        format.html { redirect_to receive_groups_path, notice: 'تم تحيث الأستقبال' }
        format.json { render :show, status: :ok, location: @receive_group }
      else
        format.html { render :edit }
        format.json { render json: @receive_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receive_groups/1
  # DELETE /receive_groups/1.json
  def destroy
    @receive_group.destroy
    respond_to do |format|
      format.html { redirect_to receive_groups_url, notice: 'تم حذف الأستقبال' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receive_group
      @receive_group = ReceiveGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receive_group_params
      params.require(:receive_group).permit(:workshop_id, :serial, :send_group_id, receive_group_lines_attributes: [:id, :job_order_id, :cost, :length, :width, :area, :note])
    end

    def form_variables
      @send_groups = SendGroup.accessible_by(current_ability)
      @workshops = Workshop.accessible_by(current_ability)
      @job_orders = JobOrder.accessible_by(current_ability)
    end
end
