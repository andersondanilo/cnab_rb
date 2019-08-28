module CnabRb::Layouts::Cnab240::Generic::Return
  class SegmentU < CnabRb::Layouts::Layout
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

      field :sequential_number_register,
        # numero_sequencial_registro
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

      field :additions_amount,
        # valor_acrescimos
        pos: 18..32,
        picture: '9(13)V9(2)'

      field :discount_amount,
        # valor_desconto
        pos: 33..47,
        picture: '9(13)V9(2)'

      field :abatement_amount,
        # valor_abatimento
        pos: 48..62,
        picture: '9(13)V9(2)'

      field :iof_amount,
        # valor_iof
        pos: 63..77,
        picture: '9(13)V9(2)'

      field :paid_amount,
        # valor_pago
        pos: 78..92,
        picture: '9(13)V9(2)'

      field :net_amount,
        # valor_liquido
        pos: 93..107,
        picture: '9(13)V9(2)'

      field :other_expenses_amount,
        # valor_outras_despesas
        pos: 108..122,
        picture: '9(13)V9(2)'

      field :other_credits_amount,
        # valor_outros_creditos
        pos: 123..137,
        picture: '9(13)V9(2)'

      field :ocurrency_date,
        # data_ocorrencia
        pos: 138..145,
        picture: '9(8)',
        date_format: '%d%m%Y'

      field :credit_date,
        # data_credito
        pos: 146..153,
        picture: '9(8)',
        date_format: '%d%m%Y'

      field :ocurrency_drawn_code,
        # ocorrencia_sacado_codigo
        pos: 154..157,
        picture: 'X(4)'

      field :ocurrency_drawn_date,
        # ocorrencia_sacado_data
        pos: 158..165,
        picture: 'X(8)'

      field :ocurrency_drawn_amount,
        # ocorrencia_sacado_valor
        pos: 166..180,
        picture: '9(13)V9(2)'

      field :ocurrency_draw_complement,
        # ocorrencia_sacado_complemento
        pos: 181..210,
        picture: 'X(30)'

      field :ocurrency_draw_corresponding,
        # codigo_banco_correspondente
        pos: 211..213,
        picture: '9(3)'

      field :our_number_bank_corresponding,
        # nosso_numero_banco_correspondente
        pos: 214..233,
        picture: '9(20)'

      field :exclusive_use_febraban_2,
        # uso_exclusivo_febraban_02
        pos: 234..240,
        picture: '9(7)'
    end
  end
end
