RSpec.describe CnabRb::Format::Picture do
  it "raise error on invalid picture" do
    expect{CnabRb::Format::Picture.new('X5')}.to raise_error(CnabRb::Error)
  end

  it "encode string" do
    picture = CnabRb::Format::Picture.new('X(5)')
    expect(picture.encode('a')).to eq('A    ')
    expect(picture.encode('AAAAAA')).to eq('AAAAA')
    expect(picture.encode(nil)).to eq('     ')
  end

  it "decode string" do
    picture = CnabRb::Format::Picture.new('X(5)')
    expect(picture.decode('A     ')).to eq('A')
  end

  it "encode integer" do
    picture = CnabRb::Format::Picture.new('9(3)')
    expect(picture.encode(9)).to eq('009')
    expect{picture.encode('9999')}.to raise_error(CnabRb::Error)
    expect(picture.encode(nil)).to eq('000')
  end

  it "decode integer" do
    picture = CnabRb::Format::Picture.new('9(3)')
    expect(picture.decode('009')).to eq(9)
  end

  it "encode float" do
    picture = CnabRb::Format::Picture.new('9(3)V9(2)')
    expect(picture.encode(1)).to eq('00100')
    expect(picture.encode(2.5)).to eq('00250')
    expect(picture.encode(2.559)).to eq('00256')
    expect(picture.encode(999.99)).to eq('99999')
    expect(picture.encode(nil)).to eq('00000')
  end

  it "decode float" do
    picture = CnabRb::Format::Picture.new('9(3)V9(2)')
    expect(picture.decode('00100')).to eq(1.0)
    expect(picture.decode('00250')).to eq(2.5)
    expect(picture.decode('00256')).to eq(2.56)
  end
end
