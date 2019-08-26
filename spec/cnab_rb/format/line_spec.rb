require "cnab_rb/format/line"
require "cnab_rb/layouts/layout"

RSpec.describe CnabRb::Format::Line do
  it "encode one line" do
    layout = CnabRb::Layouts::Layout.new

    layout.field :name,
      pos: 1..5,
      picture: 'X(5)',
      default: 'anna'

    layout.field :age,
      pos: 6..8,
      picture: '9(3)',
      default: 1

    line = CnabRb::Format::Line.new(layout)
    expect(line.encode).to eq('ANNA 001')

    line.name = 'joão'
    line.age = 30

    expect(line.name).to eq('joão')
    expect(line.age).to eq(30)
    expect(line.encode).to eq('JOAO 030')
  end

  it "decode one line" do
    layout = CnabRb::Layouts::Layout.new

    layout.field :name,
      pos: 1..5,
      picture: 'X(5)',
      default: 'anna'

    layout.field :age,
      pos: 6..8,
      picture: '9(3)',
      default: 1

    line = CnabRb::Format::Line.new(layout)
    line.decode('JOAO 030')

    expect(line.name).to eq('JOAO')
    expect(line.age).to eq(30)
  end
end
