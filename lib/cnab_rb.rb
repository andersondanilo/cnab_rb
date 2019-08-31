require "cnab_rb/version"

module CnabRb
  class Error < StandardError; end

  module Format
    module PictureFormats
      autoload :Float, 'cnab_rb/format/picture_formats/float'
      autoload :Integer, 'cnab_rb/format/picture_formats/integer'
      autoload :Text, 'cnab_rb/format/picture_formats/text'
    end

    autoload :Field, 'cnab_rb/format/field'
    autoload :File, 'cnab_rb/format/file'
    autoload :Line, 'cnab_rb/format/line'
    autoload :Picture, 'cnab_rb/format/picture'
  end

  module Layouts
    module Cnab240
      module Generic
        module Return
          autoload :SegmentT, 'cnab_rb/layouts/cnab240/generic/return/segment_t'
          autoload :SegmentU, 'cnab_rb/layouts/cnab240/generic/return/segment_u'
          autoload :SegmentW, 'cnab_rb/layouts/cnab240/generic/return/segment_w'
        end

        autoload :HeaderFile, 'cnab_rb/layouts/cnab240/generic/header_file'
        autoload :HeaderBatch, 'cnab_rb/layouts/cnab240/generic/header_batch'
        autoload :TrailerBatch, 'cnab_rb/layouts/cnab240/generic/trailer_batch'
        autoload :TrailerFile, 'cnab_rb/layouts/cnab240/generic/trailer_file'
      end
    end
    autoload :Layout, 'cnab_rb/layouts/layout'
  end

  module Return
    module Cnab240
      autoload :GenericReturn, 'cnab_rb/return/cnab240/generic_return'
      autoload :Batch, 'cnab_rb/return/cnab240/batch'
      autoload :Detail, 'cnab_rb/return/cnab240/detail'
      autoload :CaixaReturn, 'cnab_rb/return/cnab240/caixa_return'
    end

    autoload :ReturnFactory, 'cnab_rb/return/return_factory'
  end
end
