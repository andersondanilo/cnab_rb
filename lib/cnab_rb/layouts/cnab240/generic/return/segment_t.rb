module CnabRb::Layouts::Cnab240::Generic::Return
  class SegmentT < CnabRb::Layouts::Layout
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

      field :sequential_number_batch,
        # numero_sequencial_lote
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

      field :mantainer_agency,
        # agencia_mantenedora
        pos: 18..22,
        picture: '9(5)'

      field :agency_cd,
        # agencia_dv
        pos: 23..23,
        picture: '9(1)'

      field :transferor_code,
        # codigo_cedente
        pos: 24..35,
        picture: '9(12)'

      field :transferor_code_cd,
        # codigo_cedente_dv
        pos: 36..36,
        picture: '9(1)'

      field :agency_transferor_cd,
        # agencia_dv_mais_cedente_dv
        pos: 37..37,
        picture: '9(1)'

      field :our_number,
        # nosso_numero
        pos: 38..57,
        picture: '9(20)'

      field :wallet_code,
        # codigo_carteira
        pos: 58..58,
        picture: '9(1)'

      field :document_number,
        # numero_documento
        pos: 59..73,
        picture: 'X(15)'

      field :due_date,
        # data_vencimento
        pos: 74..81,
        picture: '9(8)',
        date_format: '%d%m%Y'

      field :title_amount,
        # valor_titulo
        pos: 82..96,
        picture: '9(13)V9(2)'

      field :bank_number,
        # numero_banco
        pos: 97..99,
        picture: '9(3)'

      field :collector_agency,
        # agencia_cobradora
        pos: 100..104,
        picture: '9(5)'

      field :collector_agency_cd,
        # agencia_cobradora_dac
        pos: 105..105,
        picture: '9(1)'

      field :company_use,
        # uso_empresa
        pos: 106..130,
        picture: 'X(25)'

      field :currency_code,
        # codigo_moeda
        pos: 131..132,
        picture: '9(2)'

      field :registration_type,
        # tipo_inscricao
        pos: 133..133,
        picture: '9(1)'

      field :registration_number,
        # numero_inscricao
        pos: 134..148,
        picture: '9(15)'

      field :draw_name,
        # nome_sacado
        pos: 149..188,
        picture: 'X(40)'

      field :exclusive_use_febraban_2,
        # uso_exclusivo_febraban_02
        pos: 189..198,
        picture: 'X(10)'

      field :tax_amount,
        # valor_tarifa
        pos: 199..213,
        picture: '9(13)V9(2)'

      field :rejection_indentification,
        # identificacao_rejeicao
        pos: 214..223,
        picture: 'X(10)'

      field :exclusive_use_febraban_3,
        # uso_exclusivo_febraban
        pos: 224..240,
        picture: 'X(17)'
    end
  end
end
