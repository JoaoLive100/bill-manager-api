class AddDefaultToBillsStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bills, :status, 'open'
  end
end