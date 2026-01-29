class Supplier < ApplicationRecord
  belongs_to :currency
  belongs_to :payment_term
  belongs_to :supplier_type, optional: true
  belongs_to :supplier_status
  has_many :supplier_contacts
end
