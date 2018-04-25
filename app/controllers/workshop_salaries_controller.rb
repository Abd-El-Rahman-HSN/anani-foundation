class WorkshopSalariesController < ApplicationController
  before_action :set_workshop_salary, only: [:show, :edit, :update, :destroy]

  # GET /workshop_salaries
  # GET /workshop_salaries.json
  def index
    @workshop_salaries = WorkshopSalary.all
    @locations = Location.all
  end

  # GET /workshop_salaries/1
  # GET /workshop_salaries/1.json
  def show
  end

  # GET /workshop_salaries/new
  def new
    @workshop_salary = WorkshopSalary.new
  end

  # GET /workshop_salaries/1/edit
  def edit
  end

  # POST /workshop_salaries
  # POST /workshop_salaries.json
  def create
    @workshop_salary = WorkshopSalary.new(workshop_salary_params)

    respond_to do |format|
      if @workshop_salary.save
        format.html { redirect_to @workshop_salary, notice: 'Workshop salary was successfully created.' }
        format.json { render :show, status: :created, location: @workshop_salary }
      else
        format.html { render :new }
        format.json { render json: @workshop_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshop_salaries/1
  # PATCH/PUT /workshop_salaries/1.json
  def update
    respond_to do |format|
      if @workshop_salary.update(workshop_salary_params)
        format.html { redirect_to @workshop_salary, notice: 'Workshop salary was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshop_salary }
      else
        format.html { render :edit }
        format.json { render json: @workshop_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshop_salaries/1
  # DELETE /workshop_salaries/1.json
  def destroy
    @workshop_salary.destroy
    respond_to do |format|
      format.html { redirect_to workshop_salaries_url, notice: 'Workshop salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop_salary
      @workshop_salary = WorkshopSalary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_salary_params
      params.require(:workshop_salary).permit(:date, :workshop_id, :location_id)
    end
end
