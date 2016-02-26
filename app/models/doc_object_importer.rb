class DocObjectImporter
  SERIALIZER = YARD::Serializers::DatabaseSerializer.new

  def self.import(object, parent = nil)
    new(object).import
  end

  def initialize(object, parent = nil)
    @object = object
  end

  attr_reader :object

  def import
    stored = SERIALIZER.serialize(object, parent) unless root?

    object.children.each do |child|
      DocObjectImporter.import(child, stored)
    end
  end

  def root?
    object.root?
  end
end
