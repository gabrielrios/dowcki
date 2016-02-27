# TODO: Accept credentials for private repos
# TODO: Remove tmp dir
class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :repository_url, presence: true

  belongs_to :user

  def import
    DocImporterJob.perform_later(self)
  end

  def owned_by?(owner)
    self.user == owner
  end
end
