module CnabRb::Layouts::Cnab240::Generic::Return
  class SegmentW < CnabRb::Layouts::Layout
    def init_fields
      field :bank_code,
        # codigo_banco
        pos: 1..3,
        picture: '9(3)'

      field :service_batch,
        # lote_servico
        pos: 4..7,
        picture: '9(4)'

      field :registry_type,
        # tipo_registro
        pos: 8..8,
        picture: '9(1)'

      field :sequantial_number,
        # numero_sequencial
        pos: 9..13,
        picture: '9(5)'

      field :segment_code,
        # codigo_segmento
        pos: 14..14,
        picture: 'X(1)'

      field :exclusive_use_febraban_1,
        # uso_exclusivo_febraban_01
        pos: 15..15,
        picture: 'X(1)'

      field :movement_code,
        # codigo_movimento
        pos: 16..17,
        picture: '9(2)'

      field :relative_position,
        # posicao_relativa
        pos: 18..23,
        picture: '9(6)'

      field :exclusive_use_bank_1,
        # uso_exclusivo_banco_01
        pos: 24..24,
        picture: 'X(1)'

      field :field_01_code,
        # codigo_campo_01
        pos: 25..28,
        picture: '9(4)'

      field :error_01_code,
        # codigo_erro_01
        pos: 29..31,
        picture: '9(3)'

      field :todo_repeat_code_field_error_20,
        # todo_repeat_codigo_campo_codigo_erro_20
        pos: 32..157,
        picture: 'X(126)'
    end
  end
end
