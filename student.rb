require_relative 'person'

class Student < Person
  attr_accessor :parent_permission

  def initialize(id, age, _parent_permission, name = 'Unknown')
    super(id, age, name)
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(options = {})
    super(options)
  end
end
