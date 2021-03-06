module CnabRb::Format
  class Line
    def initialize(layout, attributes = {})
      @layout = layout
      @attributes = attributes

      @layout.fields.each do |key, field|
        if @attributes[key].nil?
          @attributes[key] = nil
        end
      end
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
        substr = text[field.pos_start - 1, field.length].to_s
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

      raise NoMethodError.new("Method `#{method_name}` doesn't exist.")
    end

    def respond_to_missing?(method_name, include_private = false)
      if @attributes.key? method_name.to_sym
        return true
      end

      if method_name.to_s =~ /(.+)=/
        return @attributes.key? $1.to_sym
      end

      return false
    end

    def field_exists(field_name)
      @attributes.key? field_name.to_sym
    end
  end
end
