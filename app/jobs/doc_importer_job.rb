class DocImporterJob < ApplicationJob
  queue_as :default

  def perform(project)
    DocImporter.import(project)
  end
end
