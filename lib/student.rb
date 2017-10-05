require 'securerandom'
require 'learning/unit'

class Student
  attr_reader :name, :scores

  def initialize(name: SecureRandom.uuid, scores: {})
    @name = name
    @scores = scores
  end

  def score(domain)
    @scores[domain.to_sym]
  end
end
