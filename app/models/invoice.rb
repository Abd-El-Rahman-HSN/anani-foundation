class Invoice < ApplicationRecord
      belongs_to :job_order
      has_many :tasks, inverse_of: :invoice
      accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
