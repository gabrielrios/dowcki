class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :repository_url, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :projects, :user_id
  end
end
