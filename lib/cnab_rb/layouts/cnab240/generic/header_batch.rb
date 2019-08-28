module CnabRb
  module Layouts
    module Cnab240
      module Generic
        class HeaderFile < CnabRb::Layouts::Layout
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
              default: '1'

            field :operation_type,
              # tipo_operacao
              pos: 9..9,
              picture: 'X(1)'

            field :service_type,
              # tipo_servico
              pos: 10..11,
              picture: '9(2)',
              default: '01'

            field :release_form,
              # forma_lancamento
              pos: 12..13,
              picture: '9(2)',
              default: '00'

            field :layout_version,
              # versao_layout_lote
              pos: 14..16,
              picture: '9(3)',
              default: '030'

            field :exclusive_use_febraban_1,
              # uso_exclusivo_febraban_01
              pos: 17..17,
              picture: 'X(1)',
              default: ''

            field :registration_code,
              # codigo_inscricao
              pos: 18..18,
              picture: '9(1)'

            field :registration_number,
              # numero_inscricao
              pos: 19..33,
              picture: '9(15)'

            field :agreement_code,
              # codigo_convenio
              pos: 34..49,
              picture: 'X(16)'

            field :exclusive_use_bank_1,
              # uso_exclusivo_banco
              pos: 50..53,
              picture: 'X(4)',
              default: ''

            field :agency,
              # agencia
              pos: 54..58,
              picture: '9(5)'

            field :agency_cd,
              # agencia_dv
              pos: 59..59,
              picture: '9(1)'

            field :transferor_code,
              # codigo_cedente
              pos: 60..71,
              picture: '9(12)'

            field :transferor_code_cd,
              # codigo_cedente_dv
              pos: 72..72,
              picture: '9(1)'

            field :agency_transferor_cd,
              # agencia_mais_cedente_dv
              pos: 73..73,
              picture: '9(1)'

            field :company_name,
              # nome_empresa
              pos: 74..103,
              picture: 'X(30)'

            field :message_1,
              # mensagem_1
              pos: 104..143,
              picture: 'X(40)',
              default: ''

            field :message_2,
              # mensagem_2
              pos: 144..183,
              picture: 'X(40)',
              default: ''

            field :sequential_number_file,
              # numero_sequencial_arquivo
              pos: 184..191,
              picture: '9(8)'

            field :generation_date,
              # data_geracao
              pos: 192..199,
              picture: '9(8)',
              date_format: '%d%m%Y'

            field :credit_date,
              # data_credito
              pos: 200..207,
              picture: '9(8)',
              date_format: '%d%m%Y',
              default: '0'

            field :exclusive_use_febraban_2,
              # uso_exclusivo_febraban_02
              pos: 208..240,
              picture: 'X(33)',
              default: ''
          end
        end
      end
    end
  end
end
