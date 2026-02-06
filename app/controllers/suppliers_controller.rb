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
    params.require(:supplier).permit(:code, :name, :tax_id, :credit_limit, :notes, :supplier_type_id, :currency_id , :payment_term_id, :supplier_status_id, :city_id, :address, :country_id)
  end

  def edit
    @supplier = Supplier.includes(city: :country).find(params[:id])
    #Logger.new(STDOUT).info("Edicion de proveedor : #{@supplier.city.country_id}, ciudad: #{@supplier.city_id}")
    #Rails.logger.debug("Datos del proveedor: #{@supplier.city.country_id}, ciudad: #{@supplier.city_id}")
    @supplier_types =SupplierType.where(active: true)
    @currency = Currency.where(active: true)
    @supplier_status = SupplierStatus.where(active: true)
    @payment_term = PaymentTerm.where(active: true)
    @countries = Country.all.order(:name)
    @cities = City.where(country_id: @supplier.city.country.id).order(:name)
  end
  def update
    @supplier = Supplier.find(params[:id])
    params_to_update = supplier_params.except(:id, 'id', :country_id, 'country_id')
    Rails.logger.debug("Datos del proveedor a editar: #{params_to_update}")
    if @supplier.update(params_to_update)
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

  def show
    @supplier = Supplier.includes(:currency, :payment_term, :supplier_type, :supplier_status, :city).find(params[:id])
    @supplier_contacts = @supplier.supplier_contacts.order(:id)
    #Rails.logger.info "Supplier data: #{@supplier.attributes.inspect}"
    #Rails.logger.info "Supplier associations: currency=#{@supplier.currency.inspect}, payment_term=#{@supplier.payment_term.inspect}, supplier_type=#{@supplier.supplier_type.inspect}, supplier_status=#{@supplier.supplier_status.inspect}, city=#{@supplier.city.inspect}"
  end
end