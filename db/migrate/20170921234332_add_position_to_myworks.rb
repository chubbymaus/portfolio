class AddPositionToMyworks < ActiveRecord::Migration[5.1]
  def change
    add_column :myworks, :position, :integer
  end
end
