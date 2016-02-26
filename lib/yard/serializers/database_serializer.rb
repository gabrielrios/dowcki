module YARD
  module Serializers
    # Implements a serializer that reads from and writes to the filesystem.
    ATTRIBUTES = [:type,       :superclass,  :value,       :namespace_id,
                  :namespace,  :name,        :source,      :source_type,
                  :signature,  :dynamic,     :visibility,  :files,
                  :line,       :scope,       :parameters,  :aliases]

    class DatabaseSerializer < Base
      def serialize(object, parent)
        attributes = serialize_attributes(object, parent)

        CodeObject.create(attributes)
      end

      def serialize_attributes(object, parent)
        ATTRIBUTES.map do |attr|
          if attr == :namespace_id
            [ :namespace_id, parent.id ]
          else
            serialize_attribute(object, attr)
          end
        end
      end

      def serialize_attribute(object, attr)
        [ attr, object.try(attr) ]
      end

      def serialized_path(object)
      end
    end
  end
end
