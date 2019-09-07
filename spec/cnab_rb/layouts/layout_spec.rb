RSpec.describe CnabRb::Layouts::Layout do
  it "validate!" do
    layout = CnabRb::Layouts::Layout.new

    layout.field :age,
      pos: 5..7,
      picture: '9(3)'

    expect{layout.validate!}.to raise_error(CnabRb::Error)

    layout.field :name,
      pos: 1..4,
      picture: 'X(4)'

    expect(layout.validate!).to eq(true)
  end
end
