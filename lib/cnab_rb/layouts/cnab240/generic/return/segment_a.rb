module CnabRb::Layouts::Cnab240::Generic::Return
  class SegmentA < CnabRb::Layouts::Layout
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
        picture: '9(1)',
        default: '3'

      field :sequential_number_batch,
        # numero_sequencial_lote
        pos: 9..13,
        picture: '9(5)'

      field :segment_code,
        # codigo_segmento
        pos: 14..14,
        picture: 'X(1)',
        default: 'A'

      field :movement_type,
        # tipo_movimento
        pos: 15..15,
        picture: '9(1)',
        default: ''

      field :movement_instruction_code,
        # codigo_instrucao_movimento
        pos: 16..17,
        picture: '9(2)'

      field :centering_chamber,
        # camara_centralizadora
        pos: 18..20,
        picture: '9(3)'

      field :favored_bank,
        # banco_favorecido
        pos: 21..23,
        picture: '9(3)'

      field :favored_agency,
        # agencia_favorecido
        pos: 24..28,
        picture: '9(5)'

      field :favored_agency_cd,
        # agencia_dv_favorecido
        pos: 29..29,
        picture: 'X(1)'

      field :favored_account,
        # conta_favorecido
        pos: 30..41,
        picture: '9(12)'

      field :favored_account_cd,
        # conta_dv_favorecido
        pos: 42..42,
        picture: 'X(1)'

      field :favored_agency_account_cd,
        # agencia_conta_dv_favorecido
        pos: 43..43,
        picture: 'X(1)'

      field :favored_name,
        # nome_favorecido
        pos: 44..73,
        picture: 'X(30)'

      field :document_number,
        # numero_documento
        pos: 74..93,
        picture: 'X(20)'

      field :payment_date,
        # data_pagamento
        pos: 94..101,
        picture: '9(8)',
        date_format: '%d%m%Y'

      field :currency_code,
        # tipo_moeda
        pos: 102..104,
        picture: 'X(3)',
        default: 'BRL'

      field :coin_quantity,
        # quantidade_moeda
        pos: 105..119,
        picture: '9(10)V9(5)'

      field :payment_amount,
        # valor_pagamento
        pos: 120..134,
        picture: '9(13)V9(2)'

      field :our_number,
        # nosso_numero
        pos: 135..154,
        picture: 'X(20)'

      field :real_date,
        # data_real
        pos: 155..162,
        picture: '9(8)',
        date_format: '%d%m%Y'

      field :real_amount,
        # valor_real
        pos: 163..177,
        picture: '9(13)V9(2)'

      field :information_2,
        # informacao_2
        pos: 178..217,
        picture: 'X(40)'

      field :document_finality,
        # finalidade_doc
        pos: 218..219,
        picture: 'X(2)'

      field :ted_finality,
        # finalidade_ted
        pos: 220..224,
        picture: 'X(5)'

      field :complementary_finality,
        # finalidade_complementar
        pos: 225..226,
        picture: 'X(2)'

      field :exclusive_use_febraban_1,
        # uso_exclusivo_febraban
        pos: 227..229,
        picture: 'X(3)',
        default: ''

      field :notice,
        # aviso
        pos: 230..230,
        picture: '9(1)'

      field :ocurrences,
        # ocorencias
        pos: 231..240,
        picture: 'X(10)',
        default: ''
    end
  end
end
