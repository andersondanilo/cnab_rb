RSpec.describe CnabRb::Return::ReturnFactory do
  it "decode caixa cnab240 file" do
    factory = CnabRb::Return::ReturnFactory.new
    file_name = File.expand_path(File.dirname(__FILE__) + '/../../../fixtures/return_cnab240_caixa.ret')
    file = factory.make_return(file_name)
  end
end
