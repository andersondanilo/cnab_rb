require 'date'

module CnabRb::Format
  class Field
    attr_accessor :pos_start, :pos_end, :picture, :date_format, :default

    def initialize(params)
      @pos_start = params[:pos].begin
      @pos_end = params[:pos].end
      @picture = Picture.new(params[:picture])
      @default = params[:default]
      @date_format = params[:date_format]
    end

    def range
      @pos_start..@pos_end
    end

    def length
      @pos_end - @pos_start + 1
    end

    def validate!
      if length != @picture.length
        raise CnabRb::Error.new("Invalid picture length between #{@pos_start} and #{@pos_end}")
      end
      true
    end

    def encode(value)
      if @date_format && value.respond_to?('strftime')
        value = value.strftime(@date_format)
      end
      @picture.encode(value)
    end

    def decode(value)
      decoded = @picture.decode(value)

      unless @date_format.nil? || decoded == 0
        DateTime.strptime(decoded.to_s.rjust(length, '0'), @date_format)
      else
        decoded
      end
    end
  end
end
