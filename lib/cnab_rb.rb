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
          autoload :SegmentA, 'cnab_rb/layouts/cnab240/generic/segment_a'
          autoload :SegmentT, 'cnab_rb/layouts/cnab240/generic/segment_t'
          autoload :SegmentU, 'cnab_rb/layouts/cnab240/generic/segment_u'
          autoload :SegmentW, 'cnab_rb/layouts/cnab240/generic/segment_w'
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
    autoload :ReturnFactory, 'cnab_rb/return/return_factory'
  end
end
