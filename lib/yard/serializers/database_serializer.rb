module YARD
  module Serializers
    # Implements a serializer that reads from and writes to the filesystem.
    class DatabaseSerializer < Base
      def serialize(object, data)
        binding.pry
      end

      def serialized_path(object)
      end
    end
  end
end
