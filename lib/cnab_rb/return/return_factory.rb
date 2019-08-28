module CnabRb::Return
  class ReturnFactory
    def make_return(file_name)
      first_line = File.open(file_name, &:readline)
      format = first_line.gsub(/(\r|\n)$/, '').length
      bank_code = first_line[0, 3]
      method = "make_cnab#{format}_#{bank_code}"

      unless respond_to?(method)
        raise NotImplementedError.new("Format not implemented")
      end

      send(method, file_name)
    end

    def make_cnab240_104(file_name)
    end
  end
end
