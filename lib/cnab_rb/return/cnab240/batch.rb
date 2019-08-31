module CnabRb::Return::Cnab240
  class Batch
    attr_accessor :segments, :header, :trailer

    def initialize
      @segments = []
    end

    def details
      unless @details.nil?
        return @details
      end

      lastDetail = nil
      @details = []

      @segments.each do |s|
        if s.segment_code == 'T'
          lastDetail = Detail.new
          @details << lastDetail
        end

        unless lastDetail.nil?
          if s.segment_code == 'T'
            lastDetail.segment_t = s
          end

          if s.segment_code == 'U'
            lastDetail.segment_u = s
          end

          if s.segment_code == 'W'
            lastDetail.segment_w = s
          end
        end
      end

      @details
    end
  end
end
