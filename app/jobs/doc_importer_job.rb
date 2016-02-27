class DocImporterJob < ApplicationJob
  queue_as :default

  def perform(project)
    DocImporter.import(project)
    project.update_attributes({ processing: true })
  end
end
