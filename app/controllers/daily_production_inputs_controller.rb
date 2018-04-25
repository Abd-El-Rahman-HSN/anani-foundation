class DailyProductionInputsController < ApplicationController
  load_and_authorize_resource param_method: :dailyproductions_params
  before_action :form_variables, only: [:new, :edit, :create, :update]
  
	def index
    @dailyproductions= DailyProductionInput.accessible_by(current_ability)
  end

  def new
    @dailyproductions= DailyProductionInput.all
    @maindesignes= MainDesigne.all
    @dailyproduction= DailyProductionInput.new
    @workers = Worker.accessible_by(current_ability)
  end

  def create
    @dailyproductions= DailyProductionInput.all
    @maindesignes= MainDesigne.all
    @dailyproduction = DailyProductionInput.new(dailyproductions_params)
    @dailyproduction.serial = DailyProductionInput.assign_serial
    @workers = Worker.accessible_by(current_ability)

    respond_to do |format|
      if @dailyproduction.save
        check_job_order_finish

        format.html { redirect_to daily_production_inputs_path}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @dailyproduction = DailyProductionInput.find(params[:id])
    @workers = @dailyproduction.daily_production_lines.collect(&:worker_id).map {|x| Worker.find(x)}
    @job_orders = []
    @job_orders << JobOrder.accepted.to_ary
    @job_orders << @dailyproduction.job_order
    @job_orders.flatten!

  end

  def update
    @dailyproduction = DailyProductionInput.find(params[:id])
    @workers = Worker.accessible_by(current_ability)
    @job_orders = []
    @job_orders << JobOrder.accessible_by(current_ability).accepted.to_ary
    @job_orders << @dailyproduction.job_order
    @job_orders.flatten!

    respond_to do |format|
      if @dailyproduction.update(dailyproductions_params)
        check_job_order_finish
        format.html { redirect_to daily_production_inputs_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @dailyproduction = DailyProductionInput.find(params[:id])
    @dailyproduction.destroy
    check_job_order_finish
    redirect_to daily_production_inputs_path
  end

  private
    def dailyproductions_params
      params.require(:daily_production_input).permit(:job_order_id, :report_kind, daily_production_lines_attributes: [:id, :worker_id, :number_of_rows, :_destroy], trainees_attributes: [:id, :worker_id, :number_of_rows, :_destroy])
    end

    def form_variables
      @job_orders = JobOrder.accessible_by(current_ability).accepted
      @trainees = Worker.accessible_by(current_ability).where(category: :trainee)
    end

    def check_job_order_finish
      result = @dailyproduction.job_order.check_finish
      if result == "finished"
        flash[:success] = "تم أنهاء أمر الشغل رقم #{@dailyproduction.job_order.get_serial()}"
      elsif result == "under_production"
        flash[:success] = "تم فتح أمر الشغل رقم #{@dailyproduction.job_order.get_serial()}"
      end
    end
end


