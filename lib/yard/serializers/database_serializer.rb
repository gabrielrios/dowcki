module YARD
  module Serializers
    # Implements a serializer that reads from and writes to the filesystem.

    ATTRIBUTES = [:type,       :superclass,  :value,       :namespace_id,
                  :namespace,  :name,        :source,      :source_type,
                  :signature,  :dynamic,     :visibility,  :file,
                  :line,       :scope,       :parameters, :docstring, :attr_info]

    class DatabaseSerializer < Base
      def serialize(project, object, parent)
        attributes = serialize_attributes(object, parent)
        CodeObject.create!(Hash[attributes].merge({ project: project,
                                                    code_hash: object.hash }))
      end

      def serialize_attributes(object, parent)
        ATTRIBUTES.map do |attr|
          case attr
          when :namespace_id
            [ :namespace_id, parent.try(:id) ]
          when :attr_info
            [ :is_attribute, !!object.try(:is_attribute?) ]
          when :type
            [ :type, "#{object.send(attr).capitalize}CodeObject"]
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
