class CodeObject < ApplicationRecord
  belongs_to :project

  scope :namespaces, -> { where(namespace_id: nil) }

  validates :code_hash, uniqueness: true

  default_scope -> { order(:name) }

end
