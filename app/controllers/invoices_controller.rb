class InvoicesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @invoices= Invoice.all
  end

  def new
    @invoice= Invoice.new

  end

  def create
    @invoice=Invoice.new(create_params)
    if @invoice.save
      redirect_to(:action=>'index')
    else
      render('new')
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(create_params)
      redirect_to invoices_path
    else
      render 'edit'
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end

  private
    def create_params
      puts "*******"
      params.inspect
      #params
      #.require(:invoice)
      params.require(:invoice).permit(:invoice_serial,:date,:customer,:phone,:item,:quantity,:unit_price,:discount,:tax,:idnum,:name,:length,:width,:space,:raw,:prmetre,:total, tasks_attributes: [:names, :lengths, :widths, :spaces, :raws, :pricemetre, :totals, :_destroy])
      #params.require(:invoice).permit(:invoice_serial,:date,:customer,:phone,:item,:quantity,:unit_price,:discount,:tax,:idnum,:name,:length,:width,:space,:raw,:prmetre,:total, tasks_attributes: Task.attribute_names.map[(&:to_sym).push(:_destroy)) #[:id, :names, :lengths, :widths, :spaces, :raws, :pricemetre, :total]
    end
end


