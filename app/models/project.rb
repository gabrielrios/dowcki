# TODO: Accept credentials for private repos
# TODO: Remove tmp dir
class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :repository_url, presence: true

  has_many :code_objects
  has_many :top_level, -> { where(namespace_id: nil, type:"ModuleCodeObject") },
    class_name: "CodeObject"

  belongs_to :user

  def import
    DocImporterJob.perform_later(self)
  end

  def owned_by?(owner)
    self.user == owner
  end

  def processed?
    !processing
  end
end
