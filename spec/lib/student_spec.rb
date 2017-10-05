require 'student'

RSpec.describe Student do
  let(:scores) { { R: '1', W: 'K', M: '3' } }

  it "has a name" do
    student = Student.new(name: 'Noelle')
    expect(student.name).to eq('Noelle')
  end

  it "has a generated name when a name is not provided" do
    student = Student.new()
    expect(student.name).to_not be_empty
  end

  it "has scores" do
    student = Student.new(scores: scores)
    expect(student.scores).to eq(scores)
  end

  describe "#score" do
    it "is accurate when a domain test score exists" do
      student = Student.new(scores: scores)
      expect(student.score('M')).to eq('3')
    end

    it "is nil when a domain test score does not exist" do
      student = Student.new(scores: scores)
      expect(student.score('X')).to eq(nil)
    end
  end
end
