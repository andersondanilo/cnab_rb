require 'date'

RSpec.describe CnabRb::Return::ReturnFactory do
  it "decode caixa cnab240 file" do
    factory = CnabRb::Return::ReturnFactory.new
    file_name = __dir__ + '/../../../fixtures/return_cnab240_caixa.ret'
    file = factory.make_return(file_name)

    expect(file.details.length).to eq(9)

    detail = file.details[0]

    expect(detail.movement_code).to eq(6)
    expect(detail.net_amount).to eq(80.0)
    expect(detail.title_amount).to eq(80.0)
    expect(detail.tax_amount).to eq(1.25)
    expect(detail.iof_amount).to eq(0.0)
    expect(detail.discount_amount).to eq(0.0)
    expect(detail.abatement_amount).to eq(0.0)
    expect(detail.other_credits_amount).to eq(0.0)
    expect(detail.fine_amount).to eq(0.0)
    expect(detail.document_number).to eq('000000000000000')
    expect(detail.wallet_code).to eq(1)
    expect(detail.agency).to eq(0)
    expect(detail.our_number).to eq(240000000111369979)
    expect(detail.due_date).to eq(DateTime.new(2014, 1, 2))
    expect(detail.credit_date).to eq(DateTime.new(2014, 1, 7))
    expect(detail.ocurrency_date).to eq(DateTime.new(2014, 1, 6))
    expect(detail.collector_agency).to eq(1086)
    expect(detail.collector_agency_cd).to eq(0)
    expect(detail.sequential_number).to eq(1)
    expect(detail.is_write_off).to eq(true)
    expect(detail.is_rejected_write_off).to eq(false)
  end
end
