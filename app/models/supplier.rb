class Supplier < ApplicationRecord
    has_many :warehouse_transaction_lines
    has_many :warehouse_transaction
    belongs_to :raw_material_warehouse
end
