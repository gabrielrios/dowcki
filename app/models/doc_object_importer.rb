require 'yard/serializers/database_serializer'

class DocObjectImporter
  SERIALIZER = YARD::Serializers::DatabaseSerializer.new

  def self.import(object, parent = nil)
    new(object, parent).import
  end

  def initialize(object, parent = nil)
    @object = object
    @parent = parent
  end

  attr_reader :object, :parent

  def import
    stored = SERIALIZER.serialize(object, parent) unless root?


    if object.respond_to?(:children)
      object.children.each do |child|
        DocObjectImporter.import(child, stored)
      end
    end
  end

  def root?
    object.root?
  end
end
