class AddProcessingToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :processing, :boolean, default: true
  end
end
