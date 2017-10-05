require 'learning/unit'

module Learning
  class Path
    MAXIMUM_NEXT_UNITS = 5

    attr_reader :student

    def initialize(grades:, student:, units:)
      @student = student
      @grades = grades
      @units = units
    end

    def completed_unit?(unit_code)
      unit = Learning::Unit.new(unit_code)
      score = @student.score(unit.domain) || @grades[0]
      score_grade_level = @grades.index(score)
      unit_grade_level = @grades.index(unit.grade)
      score_grade_level > unit_grade_level
    end

    def next_units
      @units.reject{ |unit| completed_unit?(unit) }[0...MAXIMUM_NEXT_UNITS]
    end
  end
end
