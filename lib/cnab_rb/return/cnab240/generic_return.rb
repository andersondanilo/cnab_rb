module CnabRb::Return::Cnab240
  class GenericReturn < CnabRb::Format::File
    def get_line_layout(line_text)
      registry_type_table = {
        '0' => :header_file,
        '1' => :header_batch,
        '3' => :segment,
        '5' => :trailer_batch,
        '9' => :trailer_file
      }

      registry_type = registry_type_table[line_text[7, 1]]
      segment_code = line_text[13, 1]

      unless registry_type.nil?
        if :segment == registry_type
          method_name = "segment_#{segment_code.downcase}_layout"
        else
          method_name = "#{registry_type}_layout"
        end

        if respond_to?(method_name)
          send(method_name)
        end
      end
    end

    def header_file_layout
      CnabRb::Layouts::Cnab240::Generic::HeaderFile.new
    end

    def header_batch_layout
      CnabRb::Layouts::Cnab240::Generic::HeaderBatch.new
    end

    def segment_t_layout
      CnabRb::Layouts::Cnab240::Generic::Return::SegmentT.new
    end

    def segment_u_layout
      CnabRb::Layouts::Cnab240::Generic::Return::SegmentU.new
    end

    def segment_w_layout
      CnabRb::Layouts::Cnab240::Generic::Return::SegmentW.new
    end

    def trailer_batch_layout
      CnabRb::Layouts::Cnab240::Generic::TrailerBatch.new
    end

    def trailer_file_layout
      CnabRb::Layouts::Cnab240::Generic::TrailerFile.new
    end

    def batches
      unless @batches.nil?
        return @batches
      end

      lastBatch = nil
      @batches = []

      @lines.each do |line|
        if line.registry_type == 1
          lastBatch = Batch.new
          @batches.push(lastBatch)
        end

        unless lastBatch.nil?
          if line.registry_type == 1
            lastBatch.header = line
          end

          if line.registry_type == 3
            lastBatch.segments << line
          end

          if line.registry_type == 5
            lastBatch.trailer = line
          end
        end
      end

      @batches
    end

    def details
      unless @details.nil?
        return @details
      end

      @details = batches.map{|b| b.details}.flatten
    end
  end
end
