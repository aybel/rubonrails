class Supplier < ApplicationRecord
  belongs_to :currency
  belongs_to :payment_term
  belongs_to :supplier_type, optional: true
  belongs_to :supplier_status
  belongs_to :city
  has_many :supplier_contacts
  delegate :country, to: :city, allow_nil: true
end
