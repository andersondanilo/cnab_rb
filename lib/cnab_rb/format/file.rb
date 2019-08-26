require_relative "line"

module CnabRb::Format
  class File
    attr_accessor :lines

    LINE_BREAK = "\r\n"

    def initialize
      @lines = []
    end

    def encode
      @lines.map{|line| line.encode}.join(LINE_BREAK)
    end

    def decode(text)
      @lines = text.split(LINE_BREAK).map do |line_text|
        layout = get_line_layout(line_text)
        line = Line.new(layout)
        line.decode(line_text)
        line
      end
    end

    def get_line_layout(line_text)
      raise CnabRb::Error.new("get_line_layout not implemented") 
    end
  end
end
