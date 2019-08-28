module CnabRb::Layouts::Cnab240::Generic
  class TrailerFile < CnabRb::Layouts::Layout
    def init_fields
      field :bank_code,
        # codigo_banco
        pos: 1..3,
        picture: '9(3)'

      field :service_batch,
        # lote_servico
        pos: 4..7,
        picture: '9(4)',
        default: '9999'

      field :registry_type,
        # tipo_registro
        pos: 8..8,
        picture: '9(1)',
        default: '9'

      field :exclusive_use_febraban_1,
        # uso_exclusivo_febraban01
        pos: 9..17,
        picture: 'X(9)',
        default: ''

      field :batch_quantity,
        # qtde_lotes
        pos: 18..23,
        picture: '9(6)'

      field :registry_quantity,
        # qtde_registros
        pos: 24..29,
        picture: '9(6)'

      field :exclusive_use_febraban_2,
        # uso_exclusivo_febraban02
        pos: 30..35,
        picture: 'X(6)',
        default: ''

      field :exclusive_use_febraban_3,
        # uso_exclusivo_febraban_03
        pos: 36..240,
        picture: 'X(205)',
        default: ''
    end
  end
end
