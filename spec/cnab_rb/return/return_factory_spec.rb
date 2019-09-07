RSpec.describe CnabRb::Return::ReturnFactory do
  it "throw error at unsupported format" do
    factory = CnabRb::Return::ReturnFactory.new
    file_name = __dir__ + '/../../fixtures/return_cnab240_fake.ret'
    expect{factory.make_return(file_name)}.to raise_error(NotImplementedError)
  end

  it "success at supported format" do
    factory = CnabRb::Return::ReturnFactory.new
    file_name = __dir__ + '/../../fixtures/return_cnab240_caixa.ret'
    factory.make_return(file_name)
  end
end
