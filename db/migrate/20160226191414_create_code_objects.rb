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
      t.string :visibility

      t.text :file
      t.text :docstring
      t.integer :line

      t.string :scope
      t.json :parameters
      t.json :aliases
      t.boolean :is_attribute

      t.timestamps
    end

    add_index :code_objects, :code_hash, unique: true
    add_index :code_objects, :namespace
    add_index :code_objects, :name
  end
end
