class AddDefaultToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :recipes, :status, from: nil, to: 0
  end
end
