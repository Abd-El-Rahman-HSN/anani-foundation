class InvoicePaymentScheduelsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @invoicepayments= InvoicePaymentScheduel.all
  end

  def new
    @invoicepayment= InvoicePaymentScheduel.new

  end

  def create
    @invoicepayment=InvoicePaymentScheduel.new(invoicepayments_params)
    if @invoicepayment.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @invoicepayment = InvoicePaymentScheduel.find(params[:id])
  end

  def update
    @invoicepayment = InvoicePaymentScheduel.find(params[:id])
    if @invoicepayment.update(invoicepayments_params)
      redirect_to invoice_payment_scheduels_path
    else
      render 'edit'
    end
  end

  def destroy
    @invoicepayment = InvoicePaymentScheduel.find(params[:id])
    @invoicepayment.destroy
    redirect_to invoice_payment_scheduels_path
  end

  private
    def invoicepayments_params
      params.require(:invoice_payment_scheduel).permit(:amount,:due_after,:due_from)
    end
end
