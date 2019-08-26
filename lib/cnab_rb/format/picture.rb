require_relative "picture_formats/text"
require_relative "picture_formats/integer"
require_relative "picture_formats/float"

module CnabRb::Format
  class Picture
    def initialize(picture)
      if match = picture.match(/([X9])\((\d+)\)(V9\((\d+)\))?/)
        type, length, _, length_decimal = match.captures
        length = length.to_i

        unless length_decimal.nil?
          length_decimal = length_decimal.to_i
        end


        if 'X' == type
          @format = PictureFormats::Text.new(length)
        elsif ('9' == type and length_decimal.nil?)
          @format = PictureFormats::Integer.new(length)
        else
          @format = PictureFormats::Float.new(length, length_decimal)
        end
      else
        raise CnabRb::Error.new("Invalid picture #{picture}")
      end
    end

    def encode(value)
      @format.encode(value)
    end

    def decode(value)
      @format.decode(value)
    end

    def length
      @format.length
    end
  end
end
