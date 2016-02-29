class CodeObject < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :project

  validates :code_hash, uniqueness: true

  scope :classes, -> { where(type: "ClassCodeObject") }
  scope :modules, -> { where(type: "ModuleCodeObject") }

  has_many :children, -> { classes.or(modules).order(:name) },
    class_name: "CodeObject", foreign_key: :namespace_id
end
