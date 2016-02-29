# TODO: Currently the parsed path also includes test, which doesn't mean anything
# for the documentation. We need to have different project types so we can
# append a more specific path. ie:
# gems: "lib"
# apps: "{app|lib}"
# engines: #{app|lib}"
# Probably need to allow the user to specify it too

class DocImporter
  def self.import(project)
    new(project).import
  end

  def initialize(project)
    @project = project
    @repository = Repository.new(project)
  end

  attr_reader :project, :repository

  def import
    YARD::Registry.clear

    repository.clone
    YARD.parse(path)

    DocObjectImporter.import(project, YARD::Registry.root)
  end

  def path
    Pathname.new(repository.path).join("lib", "**", "*.rb").to_s
  end
end
