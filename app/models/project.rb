class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :repository_url, presence: true

  def import
    DocImporterJob.perform_later(self)
  end
end
