require "cnab_rb/format/file"
require "cnab_rb/format/line"
require "cnab_rb/layouts/layout"

RSpec.describe CnabRb::Format::File do
  it "encode" do
    layout = CnabRb::Layouts::Layout.new

    layout.field :name,
      pos: 1..5,
      picture: 'X(5)',
      default: 'anna'

    layout.field :age,
      pos: 6..8,
      picture: '9(3)',
      default: 1

    line1 = CnabRb::Format::Line.new(layout, name: 'joão', age: 10)
    line2 = CnabRb::Format::Line.new(layout, name: 'pedro', age: 11)

    file = CnabRb::Format::File.new
    file.lines << line1
    file.lines << line2

    expect(file.encode).to eq("JOAO 010\r\nPEDRO011")
  end

  it "decode" do
    file = CnabRb::Format::File.new

    def file.get_line_layout(line_text)
      layout = CnabRb::Layouts::Layout.new

      layout.field :name,
        pos: 1..5,
        picture: 'X(5)',
        default: 'anna'

      layout.field :age,
        pos: 6..8,
        picture: '9(3)',
        default: 1

      layout
    end

    file.decode("JOAO 010\r\nPEDRO011")

    expect(file.lines.length).to eq(2)
    expect(file.lines[0].name).to eq('JOAO')
    expect(file.lines[0].age).to eq(10)
    expect(file.lines[1].name).to eq('PEDRO')
    expect(file.lines[1].age).to eq(11)
  end

  it "need get_file_layout" do
    file = CnabRb::Format::File.new

    expect{file.decode("ABC")}.to raise_error(CnabRb::Error)
  end
end
