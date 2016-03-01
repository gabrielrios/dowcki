class CreateCodeObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :code_objects do |t|
      t.string  :code_hash
      t.string  :type
      t.string  :superclass
      t.string  :value

      t.integer :namespace_id
      t.string  :namespace
      t.string  :name
      t.text    :source
      t.string  :source_type
      t.string  :signature
      t.boolean :dynamic
      t.integer :visibility

      t.text :files, array: true, default: []
      t.text :docstring
      t.integer :line

      t.integer :scope
      t.json :parameters
      t.json :aliases

      t.timestamps
    end

    add_index :code_objects, :code_hash
    add_index :code_objects, :namespace
    add_index :code_objects, :name
  end
end
