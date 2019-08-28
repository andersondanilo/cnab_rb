module CnabRb
  module Layouts
    module Cnab240
      module Generic
        class HeaderFile < CnabRb::Layouts::Layout
          def init_fields
            field :bank_code,
              pos: 1..3,
              picture: '9(3)'

            field :service_batch,
              # Se registro for Header do Arquivo = '0000'
              pos: 4..7,
              picture: '9(4)',
              default: 0

            field :registry_type,
              # Código adotado pela FEBRABAN para identificar o tipo de registro.
              # '0' = Header de Arquivo
              pos: 8..8,
              picture: '9(1)',
              default: '0'

            field :exclusive_use_febraban_1,
              pos: 9..17,
              picture: 'X(9)',
              default: ''

            field :registration_code,
              # '1' = CPF
              # '2' = CGC / CNPJ
              pos: 18..18,
              picture: '9(1)'

            field :registration_number,
                # CNPJ ou CPF
              pos: 19..32,
              picture: '9(14)'

            field :agreement_code,
              # Código do Convênio no Banco (Código do Cedente)
              # Código fornecido pela CAIXA, através da agência de relacionamento do cliente, específico para
              # identificar determinados tipos de serviços / produtos.
              # O campo CÓDIGO DO CEDENTE deverá ser preenchido da seguinte forma:
              # AAAAOOOCCCCCCCCD, onde:
              # AAAA = código da Agência CAIXA de relacionamento do cliente / cedente
              # OOO = Operação
              # CCCCCCCC = Número da Conta Corrente ou seqüencial
              # D = Dígito Verificador
              pos: 33..48,
              picture: '9(16)'

            field :exclusive_use_bank_1,
              # Padrão: deixar em branco
              pos: 49..52,
              picture: 'X(4)',
              default: ''

            field :agency,
              # Código da Agência mantenedora da conta, fornecido pela CAIXA.
              pos: 53..57,
              picture: '9(5)'

            field :agency_cd,
              # Dígito Verificador da Agência mantendedora da conta, fornecido pela CAIXA.
              pos: 58..58,
              picture: '9(1)'

            field :transferor_code,
              # Código do Cedente
              # Remessa: Código do Convênio no Banco (sem operação), tamanho: 12 posições, no formato
              # 0000CCCCCCCC.
              # Retorno: Código do Convênio no Banco (com operação), tamanho: 12 posições, no formato
              # 0OOOCCCCCCCC.
              # Onde:
              # 0 = zero
              # OOO = Operação
              # CCCCCCCC = Cedente
              pos: 59..70,
              picture: '9(12)'

            field :transferor_code_cd,
              # Dígito Verificador do Cedente
              # Código adotado pela CAIXA, para verificação da autenticidade do Código do Cedente. Calculado
              # através do módulo 11.
              # Exemplo de como calcular o DV do Cedente:
              # Agência/Código do Cedente: 0012.870.00000575-1
              # Para Remessa – Cedente sem operação e sem DV: 00000575
              # Para Retorno – Cedente com operação e sem DV: 87000000575
              # 0 0 0 0 0 5 7 5
              # 9 8 7 6 5 4 3 2
              # 0 0 0 0 0 20 21 10
              # 1ª linha – Código do Cedente
              # 2ª linha – Índice multiplicação, preencher sequencialmente de 2 a 9 da direita para a esquerda
              # 3ª linha – Multiplicação coluna por coluna (0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 3x3, 3x2)
              # Soma-se os valores da 3ª linha: 0+0+0+0+0+20+21+10 = 51
              # Dividir o resultado da soma por onze: 51/11 = 4 (resto 7)
              # Subtrair onze pelo resto da divisão: 11 – 7 = 4
              # O Dígito Verificador calculado para o Código de Cedente acima é 4
              # Obs.: se o resultado da subtração for maior que 9 (nove) o dígito será 0 (zero)
              pos: 71..71,
              picture: '9(1)'

            field :agency_transferor_cd,
              # Dígito Verificador da Agência / Código do Cedente
              # Código adotado pela CAIXA para verificação da autenticidade do par Código da Agência / Código do
              # Cedente. Calculado através do módulo 11.
              # Obs: Para o Retorno é o mesmo DV do Código do Cedente, fornecido pela CAIXA.
              # Exemplo de como calcular o DV da Agência/Código do Cedente (Remessa):
              # Agência/Código do Cedente: 0012.870.00000575-1
              # Agência (sem DV): 0012
              # Cedente (sem operação e sem DV) – tamanho 8 posições: 00000575
              # 0  0  1  2  0  0  0  0  0   5   7   5
              # 5  4  3  2  9  8  7  6  5   4   3   2
              # 0  0  3  4  0  0  0  0  0  20  21  10
              # 1ª Linha – Agência/Código do Cedente
              # 2ª Linha – Ìndice multiplicação, preencher sequencialmente de 2 a 9 da direita para a esquerda
              # 3ª Linha – Multiplicação coluna por coluna
              # Soma-se os valores da 3ª linha: 0+0+3+4+0+0+0+0+0+20+21+10 = 58
              # Dividir o resultado da soma por onze: 58/11 = 5 (RESTO 3)
              # Subtrair onze pelo resto da divisão: 11 – 3 = 8
              # O Dígito Verificador calculado para o Código de Cedente acima é 8
              # Obs.: se o resultado da subtração for maior que 9 (nove) o dígito será 0 (zero)
              # No Banco do Brasil, é o Dígito verificador da Ag/Conta
              pos: 72..72,
              picture: '9(1)'

            field :company_name,
              # Nome que identifica a pessoa, física ou jurídica, a qual se quer fazer referência
              pos: 73..102,
              picture: 'X(30)'

            field :bank_name,
              # Nome que identifica o banco que está recebendo ou enviando o arquivo.
              # Informar: CAIXA ECONÔMICA FEDERAL (se o banco for a caixa)
              pos: 103..132,
              picture: 'X(30)'

            field :exclusive_use_febraban_2,
              # Texto de observações destinado para uso exclusivo da FEBRABAN. Preencher com Brancos.
              pos: 133..142,
              picture: 'X(10)',
              default: ''

            field :remittance_return_code,
              # Código Remessa / Retorno
              # Código adotado pela febraban para qualificar o envio ou devolução de arquivo entre a empresa
              # cliente e o banco prestador dos serviços. informar:
              # '1' = remessa (cliente banco)
              # '2' = retorno (banco cliente)
              pos: 143..143,
              picture: '9(1)'

            field :generation_date,
              # Data da criação do arquivo. utilizar o formato DDMMAAAA, onde : dd = dia, mm = mês, aa = ano
              pos: 144..151,
              picture: '9(8)',
              date_format: '%d%m%Y'

            field :generation_time,
              # Hora da criação do arquivo. utilizar o formato hhmmss, onde : HH = hora, MM = minuto, SS = segundo
              pos: 152..157,
              picture: '9(6)',
              date_format: '%H%M%S'

            field :sequential_number_file,
              # Número seqüencial adotado e controlado pelo responsável pela geração do arquivo para ordenar a
              # disposição dos arquivos encaminhados.
              # Evoluir um número seqüencial a cada header de arquivo.
              pos: [158, 163],
              picture: '9(6)'

            file :layout_version,
              # Código adotado pela FEBRABAN para identificar qual a versão de layout do arquivo encaminhado. O
              # código é composto de:
              # Versão = 2 dígitos
              # Release = 1 dígito
              # Padrão: 030
              pos: 164..166,
              picture: '9(3)',
              default: '030'

            file :density_file,
              # Densidade de gravação (bpi), do arquivo encaminhado. Pode ser:
              # 1600 BPI
              # 6250 BPI
              # Pode ser informado ‘0’. (Padrão)
              pos: 167..171,
              picture: '9(5)',
              default: '0'

            field :exclusive_use_bank,
              # Para Uso Reservado do Banco
              # Texto de observações destinado para uso exclusivo da caixa econômica federal.
              # Durante a fase de testes (simulado) deverá conter a literal ‘RETORNO-TESTE’
              pos: 172..191,
              picture: 'X(20)',
              default: ''

            field :exclusive_use_company,
              # Campo utilizado pelo cliente/cedente. Na fase de testes (simulado), deverá conter a literal
              # ‘REMESSA-TESTE’ e na fase de produção deverá conter a literal ‘REMESSA-PRODUÇÃO’
              pos: 192..211,
              picture: 'X(20)',
              default: 'REMESSA-PRODUCAO'

            field :exclusive_use_febraban_2,
              # Texto de observações destinado para uso exclusivo da FEBRABAN. Preencher com Brancos.
              pos: 212..240,
              picture: 'X(29)',
              default: ''
          end
        end
      end
    end
  end
end
