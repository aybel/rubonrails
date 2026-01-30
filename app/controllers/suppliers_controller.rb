class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.includes(:currency, :payment_term, :supplier_type, :supplier_status, :city).all.order(:id)
  end

  def new
    @supplier = Supplier.new
    @supplier_types =SupplierType.where(active: true)
    @currency = Currency.where(active: true)
    @supplier_status = SupplierStatus.where(active: true)
    @payment_term = PaymentTerm.where(active: true)
    @countries = Country.all.order(:name)
    @supplier.currency_id = nil # Esto sobreescribe el default de la base de datos solo para el formulario
    @supplier.payment_term_id = nil # Esto sobreescribe el default de la base de datos solo para el formulario
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to suppliers_path, notice: 'Proveedor fue creado correctamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private def supplier_params
    params.require(:supplier).permit(:code, :name, :tax_id, :credit_limit, :notes, :supplier_type_id, :currency_id , :payment_term_id, :supplier_status_id, :city_id, :address)
  end

  def edit
    @supplier = Supplier.find(params[:id])
    @supplier_types =SupplierType.where(active: true)
    @currency = Currency.where(active: true)
    @supplier_status = SupplierStatus.where(active: true)
    @payment_term = PaymentTerm.where(active: true)
    @countries = Country.all.order(:name)
  end
  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to suppliers_path, notice: 'Proveedor fue actualizado correctamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to suppliers_path, notice: 'Proveedor fue eliminado correctamente.'
  end
end