class AddProjectToCodeObject < ActiveRecord::Migration[5.0]
  def change
    add_column :code_objects, :project_id, :integer, null: false
    add_index :code_objects, :project_id
  end
end
