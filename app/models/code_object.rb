class CodeObject < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :project

  validates :code_hash, uniqueness: true

  scope :classes, -> { where(type: "ClassCodeObject") }
  scope :modules, -> { where(type: "ModuleCodeObject") }
  scope :method_objects, -> { where(type: "MethodCodeObject") }
  scope :constants, -> { where(type: "ConstantCodeObject") }
  scope :variables, -> { where(type: "ClassvariableCodeObject") }

  has_many :class_children, -> { classes.or(modules).order(:name) },
    class_name: "CodeObject", foreign_key: :namespace_id

  has_many :local_children, -> { methods.or(constants).or(variables).order(:name) }

  has_many :constants, -> { constants.order(:name) }, class_name: "CodeObject",
    foreign_key: :namespace_id
  has_many :methods, -> { method_objects.order(:name) }, class_name: "CodeObject",
    foreign_key: :namespace_id
end
