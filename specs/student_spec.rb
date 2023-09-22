require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(123, 22, true, 'Sana')
  end

  describe '#new student' do
    it 'Returns an instance of the Student class' do
      expect(@student).to be_an_instance_of(Student)
    end
  end

  describe '#id' do
    it 'Returns id of the student correctly' do
      expect(@student.id).to be(123)
    end
  end

  describe '#age' do
    it 'Returns age of the student correctly' do
      expect(@student.age).to be(22)
    end
  end

  describe '#name' do
    it 'Returns name of the student correctly' do
      expect(@student.name).to eql('Sana')
    end
  end

  describe '#parent_permission' do
    it 'Returns true for the parent_permission of the student' do
      expect(@student.parent_permission).to be_truthy
    end
  end
end
