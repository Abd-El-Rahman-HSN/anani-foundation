class AddUserIdToWorkshops < ActiveRecord::Migration[5.0]
  def change
    add_column :workshops, :user_id, :integer, index: true
  end
end
