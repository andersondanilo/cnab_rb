module CnabRb::Format
  module PictureFormats
    class Integer
      attr_reader :length

      def initialize(length)
        @length = length
      end

      def encode(value)
        value = value.to_s.rjust(@length, '0')
        if value.length > @length
          raise CnabRb::Error.new("Invalid integer length to #{value}")
        end
        value
      end

      def decode(value)
        value.to_i
      end
    end
  end
end
