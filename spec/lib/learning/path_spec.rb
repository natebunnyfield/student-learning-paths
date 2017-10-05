require 'learning/path'

RSpec.describe Learning::Path do
  let(:units) { ['K.A', 'K.B', '1.A', '1.B', '2.A', '2.B', '3.A', '3.B', '3.C'] }
  let(:grades) { %w(K 1 2 3 4 5 6 7 8 9 10 11 12) }

  describe "#completed_unit?" do
    it "is false when score is missing" do
      student = instance_double('Student', score: nil)
      path = Learning::Path.new(grades: grades, student: student, units: units)
      expect(path.completed_unit?('1.X')).to eq(false)
    end

    it "is false when score is lower" do
      student = instance_double('Student', score: 'K')
      path = Learning::Path.new(grades: grades, student: student, units: units)
      expect(path.completed_unit?('1.X')).to eq(false)
    end

    it "is false when score is the same" do
      student = instance_double('Student', score: '1')
      path = Learning::Path.new(grades: grades, student: student, units: units)
      expect(path.completed_unit?('1.X')).to eq(false)
    end

    it "is true when score is higher" do
      student = instance_double('Student', score: '2')
      path = Learning::Path.new(grades: grades, student: student, units: units)
      expect(path.completed_unit?('1.X')).to eq(true)
    end
  end

  describe "#next_units" do
    it "is the first five units when no units have been completed" do
      student = instance_double('Student', score: nil)
      path = Learning::Path.new(grades: grades, student: student, units: units)
      expect(path.next_units).to eq(['K.A', 'K.B', '1.A', '1.B', '2.A'])
    end

    it "is the next five uncompleted units when some have been completed" do
      student = instance_double('Student', score: '2')
      path = Learning::Path.new(grades: grades, student: student, units: units)
      expect(path.next_units).to eq(['2.A', '2.B', '3.A', '3.B', '3.C'])
    end

    it "is the next three uncompleted units when there are only three remaining" do
      student = instance_double('Student', score: '3')
      path = Learning::Path.new(grades: grades, student: student, units: units)
      expect(path.next_units).to eq(['3.A', '3.B', '3.C'])
    end
  end
end
