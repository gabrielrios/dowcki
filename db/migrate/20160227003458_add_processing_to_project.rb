class AddProcessingToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :code_objects, :processing, :boolean
  end
end
