require 'learning/unit'

RSpec.describe Learning::Unit do
  let(:unit) { Learning::Unit.new('2.HLST') }

  it "requires a unit code" do
    expect{ Learning::Unit.new }.to raise_error(ArgumentError)
  end

  it "requires a dot notated unit code" do
    expect{ Learning::Unit.new('NF4') }.to raise_error(ArgumentError)
  end

  it "has a code" do
    expect(unit.code).to eq('2.HLST')
  end

  it "has a grade" do
    expect(unit.grade).to eq('2')
  end

  it "has a domain" do
    expect(unit.domain).to eq('HLST')
  end
end
