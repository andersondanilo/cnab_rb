module CnabRb::Layouts::Cnab240::Generic
  class TrailerBatch < CnabRb::Layouts::Layout
    def init_fields
			field :banck_code,
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
				default: '5'

			field :exclusive_use_febraban_1,
				# uso_exclusivo_febraban_01
				pos: 9..17,
				picture: 'X(9)',
				default: ''

			field :batch_registry_quantity,
				# qtde_registro_lote
				pos: 18..23,
				picture: '9(6)'

			field :simple_charge_quantity,
				# qtde_titulo_cobranca_simples
				pos: 24..29,
				picture: '9(6)'

			field :simple_charge_total_amount,
				# valor_total_titulo_simples
				pos: 30..46,
				picture: '9(15)V9(2)'

			field :exclusive_use_febraban_2,
				# uso_exclusivo_febraban_02
				pos: 47..52,
				picture: 'X(6)',
				default: ''

			field :exclusive_use_febraban_3,
				# uso_exclusivo_febraban_03
				pos: 53..69,
				picture: '9(15)V9(2)',
				default: '0'

			field :secured_charge_quantity,
				# qtde_titulo_cobranca_caucionada
				pos: 70..75,
				picture: '9(6)'

			field :secured_charge_total_amount,
				# valor_total_titulo_caucionada
				pos: 76..92,
				picture: '9(15)V9(2)'

			field :discount_charge_quantity,
				# qtde_titulo_cobranca_descontada
				pos: 93..98,
				picture: '9(6)'

			field :discount_charge_total_amount,
				# valor_total_titulo_descontada
				pos: 99..115,
				picture: '9(15)V9(2)'

			field :exclusive_use_febraban_4,
				# uso_exclusivo_febraban_04
				pos: 116..123,
				picture: 'X(8)',
				default: ''

			field :exclusive_use_febraban_5,
				# uso_exclusivo_febraban_05
				pos: 124..240,
				picture: 'X(117)',
				default: ''
    end
  end
end
