module CnabRb::Layouts
  class Layout
    attr_accessor :fields

    def initialize
      @fields = {}
      init_fields
    end

    def init_fields
    end

    def field(name, params)
      clean(params[:pos])
      @fields[name] = CnabRb::Format::Field.new(params)
    end

    def clean(range)
      @fields.reject! do |key, field|
        range.cover?(field.range.begin) || field.range.cover?(range.begin)
      end
    end

    def validate!
      expected_line_length = ordered_fields.last[1].pos_end
      actual_line_length = @fields.sum do |key, field|
        field.validate!
        field.length
      end

      if expected_line_length != actual_line_length
        raise CnabRb::Error.new("Invalid layout length, expected #{expected_line_length}, actual #{actual_line_length}, layout: #{self.class}")
      end
    end

    def ordered_fields
      @fields.sort_by {|key, field| field.pos_start}
    end
  end
end
