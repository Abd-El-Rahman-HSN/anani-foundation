class WorkersController < ApplicationController
  load_and_authorize_resource param_method: :workers_params
  before_action :form_variables, only: [:new, :edit, :create, :update]

  def index
    if params[:workshop_id]
      @workers = Worker.accessible_by(current_ability).where(workshop_id: params[:workshop_id])
      @workshop_id = params[:workshop_id]
      @total_expenses = 0
      @total_income = 0
    elsif params[:job_order_id]
      @job_order = JobOrder.find(params[:job_order_id])
      @workshop = Workshop.find(@job_order.workshop_id)
      if params[:workshop] == 'seda'
        @workers = Worker.where(workshop_id: @workshop.id)
      elsif params[:workshop] == 'rsomat'
        @workers = Worker.where(workshop_id: @workshop.id, category: 'worker')
      end
    elsif params[:category]
      @workers = Worker.accessible_by(current_ability).where(category: params[:category])
    else
      @workers= Worker.accessible_by(current_ability)
    end
  end

  def new
    @worker= Worker.new
  end

  def create
    @worker=Worker.new(workers_params)
    @worker.code = Worker.assign_serial(@worker.workshop_id)
    respond_to do |format|
      if @worker.save
        format.html { redirect_to workers_path}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(workers_params)
      redirect_to workers_path
    else
      render 'edit'
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    redirect_to workers_path
  end

  private
    def workers_params
      params.require(:worker).permit(:name, :workshop_id, :hire_date, :address, :phone, :category, :rate_unit, :rate_amount, :fired, :firing_date)
    end

    def form_variables
      @workshops = Workshop.all
    end
end
