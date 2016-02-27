require 'yard/serializers/database_serializer'

class DocObjectImporter
  SERIALIZER = YARD::Serializers::DatabaseSerializer.new

  def self.import(project, object, parent = nil)
    new(project, object, parent).import
  end

  def initialize(project, object, parent = nil)
    @project = project
    @object  = object
    @parent  = parent
  end

  attr_reader :object, :parent, :project

  def import
    stored = SERIALIZER.serialize(project, object, parent) unless root?


    if object.respond_to?(:children)
      object.children.each do |child|
        DocObjectImporter.import(project, child, stored)
      end
    end
  end

  def root?
    object.root?
  end
end
