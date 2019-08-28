RSpec.describe CnabRb::Format::Field do
  it "decode date" do
    params = {pos: 1..6, picture: '9(6)', date_format: '%d%m%y'}
    field = CnabRb::Format::Field.new params

    date = field.decode('200714')
    expect(date).to be_a(DateTime)
    expect(date.strftime('%Y-%m-%d %H:%M:%S')).to eq('2014-07-20 00:00:00')
  end

  it "encode date" do
    params = {pos: 1..6, picture: '9(6)', date_format: '%d%m%y'}
    field = CnabRb::Format::Field.new params

    date = DateTime.new(2015, 10, 11)
    expect(field.encode(date)).to eq('111015')
  end
end
