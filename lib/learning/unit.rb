module Learning
  class Unit
    attr_reader :code, :domain, :grade

    def initialize(code)
      raise ArgumentError unless self.class.valid_code?(code)

      @code = code
      @grade = code.split('.')[0]
      @domain = code.split('.')[1]
    end

    def self.valid_code?(code)
      /\w+\.\w+/ === code
    end
  end
end
