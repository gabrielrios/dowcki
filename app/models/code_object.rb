class CodeObject < ApplicationRecord
  self.inheritance_column = :_type_disabled

  validates :code_hash, uniqueness: true
end
