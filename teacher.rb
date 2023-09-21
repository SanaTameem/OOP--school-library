require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, age, specialization, name = 'Unknown')
    super(id, age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(options = {})
    super(options)
  end
end
