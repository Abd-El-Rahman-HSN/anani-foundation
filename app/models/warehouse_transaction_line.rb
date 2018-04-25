class WarehouseTransactionLine < ApplicationRecord
	attr_accessor :available_quantity, :status
	validates_presence_of :required_quantity, if: :check_status_release?
	validates_presence_of :quantity, :raw_material_warehouse_id
	validates_numericality_of :quantity, less_than_or_equal_to: :required_quantity, if: :check_status_release?
	validates_numericality_of :quantity, less_than_or_equal_to: :available_quantity, if: :check_status_release?
	validates_numericality_of :quantity, greater_than_or_equal_to: 0, if: :check_status_release?
	validates_numericality_of :required_quantity, greater_than_or_equal_to: 0, if: :check_status_release?

	before_validation :cast_available

	after_create :update_material_quantity
	after_update :material_quantity_when_update

	before_destroy :update_quantity_destroy

	belongs_to :supplier
	belongs_to :warehouse_transaction, optional: true
	belongs_to :raw_material_warehouse
	belongs_to :request_material_line


	def update_material_quantity
		if warehouse_transaction.status == 'add'
			new_quantity = (raw_material_warehouse.quantity || 0) + quantity
			raw_material_warehouse.update_attribute(:quantity, new_quantity)
		elsif warehouse_transaction.status == 'release'
			new_quantity = (raw_material_warehouse.quantity || 0) - quantity
			raw_material_warehouse.update_attribute(:quantity, new_quantity)
		end
	end

	def material_quantity_when_update
		if quantity_changed?
			if warehouse_transaction.status == 'add'
				added = quantity - quantity_was
				new_quantity = (raw_material_warehouse.quantity || 0) + added
				raw_material_warehouse.update_attribute(:quantity, new_quantity)
			elsif warehouse_transaction.status == 'release'
				added = quantity - quantity_was
				new_quantity = (raw_material_warehouse.quantity || 0) - added
				raw_material_warehouse.update_attribute(:quantity, new_quantity)
			end
		end
	end

	def check_status_release?
		status == 'release'
	end

	def update_quantity_destroy
		if warehouse_transaction.status == 'release'
			new_quantity = (raw_material_warehouse.quantity || 0) + quantity
			raw_material_warehouse.update_attribute(:quantity, new_quantity)
		elsif warehouse_transaction.status == 'add'
			new_quantity = (raw_material_warehouse.quantity || 0) - quantity
			raw_material_warehouse.update_attribute(:quantity, new_quantity)
		end
	end

	def cast_available
		self.available_quantity = available_quantity.to_i
	end
end
