class CodeObject < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :project

  validates :code_hash, uniqueness: true

  has_many :children, -> { where(type: ["ClassCodeObject", "ModuleClassObject"]) },
    class_name: "CodeObject", foreign_key: :namespace_id
end
