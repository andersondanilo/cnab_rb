module CnabRb::Format::PictureFormats
  class Float
    def initialize(length_left, length_right)
      @length_right = length_right
      @format_left = CnabRb::Format::PictureFormats::Integer.new(length_left)
    end

    def encode(value)
      left_value = get_left_value(value)
      right_value = get_right_value(value)
      left_value + right_value
    end

    def get_left_value(value)
      @format_left.encode(value.to_s.split('.')[0])
    end

    def get_right_value(value)
      value.to_f.round(@length_right).to_s.split('.')[1].ljust(@length_right, '0')
    end

    def decode(value)
      value.to_f / 10.pow(@length_right)
    end

    def length
      @format_left.length + @length_right
    end
  end
end
