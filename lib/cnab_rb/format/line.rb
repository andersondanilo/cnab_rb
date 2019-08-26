module CnabRb::Format
  class Line
    def initialize(layout, attributes = {})
      @layout = layout
      @attributes = attributes
    end

    def encode
      @layout.validate!
      pieces = @layout.ordered_fields.map do |field_array|
        key, field = field_array
        field.encode(@attributes[key] || field.default)
      end
      pieces.join
    end

    def decode(text)
      @layout.validate!
      @layout.fields.each do |key, field|
        substr = text[field.pos_start - 1, field.length]
        @attributes[key] = field.decode(substr)
      end
    end

    def method_missing(method_name, *args)
      if @attributes.key? method_name.to_sym
        return @attributes[method_name.to_sym]
      end

      if method_name =~ /(.+)=/
        return @attributes[$1.to_sym] = args[0]
      end

      raise ArgumentError.new("Method `#{method_name}` doesn't exist.")
    end

    def respond_to_missing?(method_name)
      if @attributes.key? method_name.to_sym
        return true
      end

      if method_name =~ /(.+)=/
        return @attributes.key? $1.to_sym
      end

      return false
    end
  end
end
