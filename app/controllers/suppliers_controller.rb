class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.includes(:currency, :payment_term, :supplier_type, :supplier_status).all
  end

  def new

  end
end
