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
    YARD.parse(repository.path)

    DocObjectImporter.import(project, YARD::Registry.root)
  end

  def clone
    remove_path if already_cloned?
  end

end
